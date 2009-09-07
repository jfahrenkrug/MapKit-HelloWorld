/*
 * AppController.j
 * MapKit-HelloWorld
 *
 * Created by You on June 10, 2009.
 * Copyright 2009, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <MapKit/MKMapView.j>


@implementation AppController : CPObject
{
    MKMapView   _mapView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var frameRect = CGRectMake(0,0, CPRectGetWidth([contentView frame]), CPRectGetHeight([contentView frame]));
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, frameRect.size.width, frameRect.size.height) apiKey:''];
    [_mapView setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
    [_mapView setDelegate:self];
    [contentView addSubview:_mapView];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    [CPMenu setMenuBarVisible:YES];
}

- (void)mapViewIsReady:(MKMapView)mapView {
    var loc = GLatLng.fromUrlValue("51.8978655,-8.4710941");
    var marker = [[MKMarker alloc] initAtLocation:loc];
    [marker addToMapView:_mapView];
    [_mapView gMap].setCenter(loc);
}

@end
