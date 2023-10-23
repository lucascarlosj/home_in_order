import 'package:micro_auth/features/auth_signup/domain/models/user_location.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import 'package:micro_design_system/micro_design_system.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  GoogleMapController? mapController;
  LatLng? _currentPosition = LatLng(0, 0);
  String? _selectAddress;
  final searchAddressEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      print('$_currentPosition');
    });

    _updateAddress(_currentPosition!);

    mapController!.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> _searchAddress() async {
    List<Location> locations = await locationFromAddress(searchAddressEC.text);
    if (locations.isNotEmpty) {
      setState(() {
        _currentPosition =
            LatLng(locations.first.latitude, locations.first.longitude);
        mapController!.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
      });
    } else {
      List<Location> locations =
          await locationFromAddress("CEP " + searchAddressEC.text);
      if (locations.isNotEmpty) {
        setState(() {
          _currentPosition =
              LatLng(locations.first.latitude, locations.first.longitude);
          mapController!
              .animateCamera(CameraUpdate.newLatLng(_currentPosition!));
        });
      }
    }
  }

  Future<void> _updateAddress(LatLng position) async {
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      setState(() {
        _selectAddress =
            '${placemarks.first.street}, ${placemarks.first.name}, ${placemarks.first.postalCode}';
        searchAddressEC.text = _selectAddress!;
      });
    }
  }

  void _onMapTap(LatLng latLng) {
    _updateAddress(latLng);
    Marker marker = Marker(
      markerId: MarkerId('1'),
      position: latLng,
      draggable: true,
      onDragEnd: (position) => _updateAddress(position),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    setState(() {
      markers.add(marker);
    });
  }

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder.instance
        .withoutAppBar()
        .addBodyChild(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _currentPosition ?? LatLng(0, 0),
                  zoom: 15,
                ),
                mapToolbarEnabled: true,
                buildingsEnabled: true,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onTap: (position) => _onMapTap(position),
                markers: markers.toSet(),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: CustomElevatedButton(
                      label: 'Confirmar',
                      onPressed: () => Navigator.pop(
                        context,
                        UserLocation(
                          address: _selectAddress!,
                          latitude: _currentPosition!.latitude.toString(),
                          longitude: _currentPosition!.longitude.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 15,
                left: 0,
                child: Row(
                  children: [
                    CustomBackButton(),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar endereço',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _searchAddress,
                            icon: Icon(Icons.search),
                          ),
                        ),
                        controller: searchAddressEC,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .build();
  }
}
