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
    var loc = [[MKLocation alloc] initWithLatitude:51.8978655 andLongitude:-8.4710941];
    var marker = [[MKMarker alloc] initAtLocation:loc];
    [marker setInfoWindowHTML:'<object width="384" height="313"><param name="movie" value="http://www.youtube.com/v/J---aiyznGQ&hl=en_US&fs=1"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/J---aiyznGQ&hl=en_US&fs=1" type="application/x-shockwave-flash" width="384" height="313" allowscriptaccess="always" allowfullscreen="true"></embed></object>' openOnClick:YES];
    [marker addToMapView:_mapView];
    [mapView setCenter:loc];
    
    //draw line
    var line = [MKPolyline polyline];
    [line addLocation:[MKLocation locationWithLatitude:51.8978655 andLongitude:-8.4710941]];
    [line addLocation:[MKLocation locationWithLatitude:37.775196 andLongitude:-122.419204]];
    [line addToMapView:_mapView];
    
    //add another marker
    var marker = [[MKMarker alloc] initAtLocation:[MKLocation locationWithLatitude:37.775196 andLongitude:-122.419204]];
    [marker addToMapView:_mapView];
    [marker setInfoWindowHTML:@"Visit my <a href='http://springenwerk.com'>great website</a>!" openOnClick:YES];
}

@end
