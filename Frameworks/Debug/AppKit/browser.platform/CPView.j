I;20;Foundation/CPArray.jI;26;Foundation/CPObjJRuntime.ji;19;CGAffineTransform.ji;12;CGGeometry.ji;9;CPColor.ji;20;CPDOMDisplayServer.ji;12;CPGeometry.ji;19;CPGraphicsContext.ji;13;CPResponder.ji;9;CPTheme.jc;85744;
CPViewNotSizable = 0;
CPViewMinXMargin = 1;
CPViewWidthSizable = 2;
CPViewMaxXMargin = 4;
CPViewMinYMargin = 8;
CPViewHeightSizable = 16;
CPViewMaxYMargin = 32;
CPViewBoundsDidChangeNotification = "CPViewBoundsDidChangeNotification";
CPViewFrameDidChangeNotification = "CPViewFrameDidChangeNotification";
var CachedNotificationCenter = nil,
    CachedThemeAttributes = nil;
var DOMElementPrototype = nil,
    BackgroundTrivialColor = 0,
    BackgroundVerticalThreePartImage = 1,
    BackgroundHorizontalThreePartImage = 2,
    BackgroundNinePartImage = 3,
    CustomDrawRectViews = {},
    CustomLayoutSubviewsViews = {};
{var the_class = objj_allocateClassPair(CPResponder, "CPView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_window"), new objj_ivar("_superview"), new objj_ivar("_subviews"), new objj_ivar("_graphicsContext"), new objj_ivar("_tag"), new objj_ivar("_frame"), new objj_ivar("_bounds"), new objj_ivar("_boundsTransform"), new objj_ivar("_inverseBoundsTransform"), new objj_ivar("_registeredDraggedTypes"), new objj_ivar("_registeredDraggedTypesArray"), new objj_ivar("_isHidden"), new objj_ivar("_hitTests"), new objj_ivar("_postsFrameChangedNotifications"), new objj_ivar("_postsBoundsChangedNotifications"), new objj_ivar("_inhibitFrameAndBoundsChangedNotifications"), new objj_ivar("_displayHash"), new objj_ivar("_DOMElement"), new objj_ivar("_DOMContentsElement"), new objj_ivar("_DOMImageParts"), new objj_ivar("_DOMImageSizes"), new objj_ivar("_backgroundType"), new objj_ivar("_dirtyRect"), new objj_ivar("_opacity"), new objj_ivar("_backgroundColor"), new objj_ivar("_autoresizesSubviews"), new objj_ivar("_autoresizingMask"), new objj_ivar("_layer"), new objj_ivar("_wantsLayer"), new objj_ivar("_isInFullScreenMode"), new objj_ivar("_fullScreenModeState"), new objj_ivar("_needsLayout"), new objj_ivar("_ephemeralSubviews"), new objj_ivar("_theme"), new objj_ivar("_themeAttributes"), new objj_ivar("_themeState"), new objj_ivar("_nextKeyView"), new objj_ivar("_previousKeyView")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPView__init(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "initWithFrame:", CGRectMakeZero());
}
}), new objj_method(sel_getUid("initWithFrame:"), function $CPView__initWithFrame_(self, _cmd, aFrame)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "init");
    if (self)
    {
        var width = (aFrame.size.width),
            height = (aFrame.size.height);
        _subviews = [];
        _registeredDraggedTypes = objj_msgSend(CPSet, "set");
        _registeredDraggedTypesArray = [];
        _tag = -1;
        _frame = { origin: { x:aFrame.origin.x, y:aFrame.origin.y }, size: { width:aFrame.size.width, height:aFrame.size.height } };
        _bounds = { origin: { x:0.0, y:0.0 }, size: { width:width, height:height } };
        _autoresizingMask = CPViewNotSizable;
        _autoresizesSubviews = YES;
        _opacity = 1.0;
        _isHidden = NO;
        _hitTests = YES;
        _displayHash = objj_msgSend(self, "hash");
        _DOMElement = DOMElementPrototype.cloneNode(false);
        if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = (aFrame.origin.x); CPDOMDisplayServerInstructions[__index + 4] = (aFrame.origin.y);;
        if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = height;;
        _DOMImageParts = [];
        _DOMImageSizes = [];
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themeState = CPThemeStateNormal;
        objj_msgSend(self, "_loadThemeAttributes");
    }
    return self;
}
}), new objj_method(sel_getUid("superview"), function $CPView__superview(self, _cmd)
{ with(self)
{
    return _superview;
}
}), new objj_method(sel_getUid("subviews"), function $CPView__subviews(self, _cmd)
{ with(self)
{
    return _subviews;
}
}), new objj_method(sel_getUid("window"), function $CPView__window(self, _cmd)
{ with(self)
{
    return _window;
}
}), new objj_method(sel_getUid("addSubview:"), function $CPView__addSubview_(self, _cmd, aSubview)
{ with(self)
{
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, CPNotFound);
}
}), new objj_method(sel_getUid("addSubview:positioned:relativeTo:"), function $CPView__addSubview_positioned_relativeTo_(self, _cmd, aSubview, anOrderingMode, anotherView)
{ with(self)
{
    var index = anotherView ? objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", anotherView) : CPNotFound;
    if (index === CPNotFound)
        index = (anOrderingMode === CPWindowAbove) ? objj_msgSend(_subviews, "count") : 0;
    else if (anOrderingMode === CPWindowAbove)
        ++index;
    objj_msgSend(self, "_insertSubview:atIndex:", aSubview, index);
}
}), new objj_method(sel_getUid("_insertSubview:atIndex:"), function $CPView___insertSubview_atIndex_(self, _cmd, aSubview, anIndex)
{ with(self)
{
    var count = _subviews.length;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    if (aSubview._superview == self)
    {
        var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
        if (index === anIndex || index === count - 1 && anIndex === count)
            return;
        objj_msgSend(_subviews, "removeObjectAtIndex:", index);
        CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 8; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = aSubview._DOMElement;;
        if (anIndex > index)
            --anIndex;
        --count;
    }
    else
    {
        objj_msgSend(aSubview, "removeFromSuperview");
        objj_msgSend(aSubview, "_setWindow:", _window);
        objj_msgSend(aSubview, "viewWillMoveToSuperview:", self);
        aSubview._superview = self;
    }
    if (anIndex === CPNotFound || anIndex >= count)
    {
        _subviews.push(aSubview);
        if (aSubview._DOMElement.CPDOMDisplayContext) aSubview._DOMElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = aSubview._DOMElement;;
    }
    else
    {
        _subviews.splice(anIndex, 0, aSubview);
        if (aSubview._DOMElement.CPDOMDisplayContext) aSubview._DOMElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 7; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = aSubview._DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _subviews[anIndex + 1]._DOMElement;;
    }
    objj_msgSend(aSubview, "setNextResponder:", self);
    objj_msgSend(aSubview, "viewDidMoveToSuperview");
    objj_msgSend(self, "didAddSubview:", aSubview);
}
}), new objj_method(sel_getUid("didAddSubview:"), function $CPView__didAddSubview_(self, _cmd, aSubview)
{ with(self)
{
}
}), new objj_method(sel_getUid("removeFromSuperview"), function $CPView__removeFromSuperview(self, _cmd)
{ with(self)
{
    if (!_superview)
        return;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    objj_msgSend(_superview, "willRemoveSubview:", self);
    objj_msgSend(objj_msgSend(_superview, "subviews"), "removeObject:", self);
        CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 8; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _superview._DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement;;
    _superview = nil;
    objj_msgSend(self, "_setWindow:", nil);
}
}), new objj_method(sel_getUid("replaceSubview:with:"), function $CPView__replaceSubview_with_(self, _cmd, aSubview, aView)
{ with(self)
{
    if (aSubview._superview != self)
        return;
    var index = objj_msgSend(_subviews, "indexOfObjectIdenticalTo:", aSubview);
    objj_msgSend(aSubview, "removeFromSuperview");
    objj_msgSend(self, "_insertSubview:atIndex:", aView, index);
}
}), new objj_method(sel_getUid("_setWindow:"), function $CPView___setWindow_(self, _cmd, aWindow)
{ with(self)
{
    if (_window === aWindow)
        return;
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
    if (objj_msgSend(_window, "firstResponder") === self)
        objj_msgSend(_window, "makeFirstResponder:", nil);
    objj_msgSend(self, "viewWillMoveToWindow:", aWindow);
    if (_registeredDraggedTypes)
    {
        objj_msgSend(_window, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
        objj_msgSend(aWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    }
    _window = aWindow;
    var count = objj_msgSend(_subviews, "count");
    while (count--)
        objj_msgSend(_subviews[count], "_setWindow:", aWindow);
    objj_msgSend(self, "viewDidMoveToWindow");
    objj_msgSend(objj_msgSend(self, "window"), "_dirtyKeyViewLoop");
}
}), new objj_method(sel_getUid("isDescendantOf:"), function $CPView__isDescendantOf_(self, _cmd, aView)
{ with(self)
{
    var view = self;
    do
    {
        if (view == aView)
            return YES;
    } while(view = objj_msgSend(view, "superview"))
    return NO;
}
}), new objj_method(sel_getUid("viewDidMoveToSuperview"), function $CPView__viewDidMoveToSuperview(self, _cmd)
{ with(self)
{
        objj_msgSend(self, "setNeedsDisplay:", YES);
}
}), new objj_method(sel_getUid("viewDidMoveToWindow"), function $CPView__viewDidMoveToWindow(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToSuperview:"), function $CPView__viewWillMoveToSuperview_(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("viewWillMoveToWindow:"), function $CPView__viewWillMoveToWindow_(self, _cmd, aWindow)
{ with(self)
{
}
}), new objj_method(sel_getUid("willRemoveSubview:"), function $CPView__willRemoveSubview_(self, _cmd, aView)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingMenuItem"), function $CPView__enclosingMenuItem(self, _cmd)
{ with(self)
{
    var view = self;
    while (view && !objj_msgSend(view, "isKindOfClass:", objj_msgSend(_CPMenuItemView, "class")))
        view = objj_msgSend(view, "superview");
    if (view)
        return view._menuItem;
    return nil;
}
}), new objj_method(sel_getUid("setTag:"), function $CPView__setTag_(self, _cmd, aTag)
{ with(self)
{
    _tag = aTag;
}
}), new objj_method(sel_getUid("tag"), function $CPView__tag(self, _cmd)
{ with(self)
{
    return _tag;
}
}), new objj_method(sel_getUid("viewWithTag:"), function $CPView__viewWithTag_(self, _cmd, aTag)
{ with(self)
{
    if (objj_msgSend(self, "tag") === aTag)
        return self;
    var index = 0,
        count = _subviews.length;
    for (; index < count; ++index)
    {
        var view = objj_msgSend(_subviews[index], "viewWithTag:", aTag);
        if (view)
            return view;
    }
    return nil;
}
}), new objj_method(sel_getUid("isFlipped"), function $CPView__isFlipped(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setFrame:"), function $CPView__setFrame_(self, _cmd, aFrame)
{ with(self)
{
    if (((_frame.origin.x == aFrame.origin.x && _frame.origin.y == aFrame.origin.y) && (_frame.size.width == aFrame.size.width && _frame.size.height == aFrame.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setFrameOrigin:", aFrame.origin);
    objj_msgSend(self, "setFrameSize:", aFrame.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsFrameChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("frame"), function $CPView__frame(self, _cmd)
{ with(self)
{
    return { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } };
}
}), new objj_method(sel_getUid("setCenter:"), function $CPView__setCenter_(self, _cmd, aPoint)
{ with(self)
{
    objj_msgSend(self, "setFrameOrigin:", CGPointMake(aPoint.x - _frame.size.width / 2.0, aPoint.y - _frame.size.height / 2.0));
}
}), new objj_method(sel_getUid("center"), function $CPView__center(self, _cmd)
{ with(self)
{
    return CGPointMake(_frame.size.width / 2.0 + _frame.origin.x, _frame.size.height / 2.0 + _frame.origin.y);
}
}), new objj_method(sel_getUid("setFrameOrigin:"), function $CPView__setFrameOrigin_(self, _cmd, aPoint)
{ with(self)
{
    var origin = _frame.origin;
    if (!aPoint || (origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
    if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = _superview ? _superview._boundsTransform : NULL; CPDOMDisplayServerInstructions[__index + 3] = origin.x; CPDOMDisplayServerInstructions[__index + 4] = origin.y;;
}
}), new objj_method(sel_getUid("setFrameSize:"), function $CPView__setFrameSize_(self, _cmd, aSize)
{ with(self)
{
    var size = _frame.size;
    if (!aSize || (size.width == aSize.width && size.height == aSize.height))
        return;
    var oldSize = { width:size.width, height:size.height };
    size.width = aSize.width;
    size.height = aSize.height;
    if (YES)
    {
        _bounds.size.width = aSize.width;
        _bounds.size.height = aSize.height;
    }
    if (_layer)
        objj_msgSend(_layer, "_owningViewBoundsChanged");
    if (_autoresizesSubviews)
        objj_msgSend(self, "resizeSubviewsWithOldSize:", oldSize);
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = size.width; CPDOMDisplayServerInstructions[__index + 3] = size.height;;
    if (_DOMContentsElement)
    {
        if (!_DOMContentsElement.CPDOMDisplayContext) _DOMContentsElement.CPDOMDisplayContext = []; var __index = _DOMContentsElement.CPDOMDisplayContext[5]; if (!(__index >= 0)) { __index = _DOMContentsElement.CPDOMDisplayContext[5] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 5; CPDOMDisplayServerInstructions[__index + 1] = _DOMContentsElement; CPDOMDisplayServerInstructions[__index + 2] = size.width; CPDOMDisplayServerInstructions[__index + 3] = size.height;;
        if (!_DOMContentsElement.CPDOMDisplayContext) _DOMContentsElement.CPDOMDisplayContext = []; var __index = _DOMContentsElement.CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMContentsElement.CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMContentsElement; CPDOMDisplayServerInstructions[__index + 2] = size.width; CPDOMDisplayServerInstructions[__index + 3] = size.height;;
    }
    if (_backgroundType !== BackgroundTrivialColor)
    {
        var images = objj_msgSend(objj_msgSend(_backgroundColor, "patternImage"), "imageSlices");
        if (_backgroundType === BackgroundVerticalThreePartImage)
        {
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = size.width; CPDOMDisplayServerInstructions[__index + 3] = size.height - _DOMImageSizes[0].height - _DOMImageSizes[2].height;;
        }
        else if (_backgroundType === BackgroundHorizontalThreePartImage)
        {
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = size.width - _DOMImageSizes[0].width - _DOMImageSizes[2].width; CPDOMDisplayServerInstructions[__index + 3] = size.height;;
        }
        else if (_backgroundType === BackgroundNinePartImage)
        {
            var width = size.width - _DOMImageSizes[0].width - _DOMImageSizes[2].width,
                height = size.height - _DOMImageSizes[0].height - _DOMImageSizes[6].height;
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[0].height;;
            if (!_DOMImageParts[3].CPDOMDisplayContext) _DOMImageParts[3].CPDOMDisplayContext = []; var __index = _DOMImageParts[3].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[3].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[3]; CPDOMDisplayServerInstructions[__index + 2] = _DOMImageSizes[3].width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[4].CPDOMDisplayContext) _DOMImageParts[4].CPDOMDisplayContext = []; var __index = _DOMImageParts[4].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[4].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[4]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[5].CPDOMDisplayContext) _DOMImageParts[5].CPDOMDisplayContext = []; var __index = _DOMImageParts[5].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[5].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[5]; CPDOMDisplayServerInstructions[__index + 2] = _DOMImageSizes[5].width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[7].CPDOMDisplayContext) _DOMImageParts[7].CPDOMDisplayContext = []; var __index = _DOMImageParts[7].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[7].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[7]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[7].height;;
        }
    }
    if (_postsFrameChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setBounds:"), function $CPView__setBounds_(self, _cmd, bounds)
{ with(self)
{
    if (((_bounds.origin.x == bounds.origin.x && _bounds.origin.y == bounds.origin.y) && (_bounds.size.width == bounds.size.width && _bounds.size.height == bounds.size.height)))
        return;
    _inhibitFrameAndBoundsChangedNotifications = YES;
    objj_msgSend(self, "setBoundsOrigin:", bounds.origin);
    objj_msgSend(self, "setBoundsSize:", bounds.size);
    _inhibitFrameAndBoundsChangedNotifications = NO;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("bounds"), function $CPView__bounds(self, _cmd)
{ with(self)
{
    return { origin: { x:_bounds.origin.x, y:_bounds.origin.y }, size: { width:_bounds.size.width, height:_bounds.size.height } };
}
}), new objj_method(sel_getUid("setBoundsOrigin:"), function $CPView__setBoundsOrigin_(self, _cmd, aPoint)
{ with(self)
{
    var origin = _bounds.origin;
    if ((origin.x == aPoint.x && origin.y == aPoint.y))
        return;
    origin.x = aPoint.x;
    origin.y = aPoint.y;
    if (origin.x != 0 || origin.y != 0)
    {
        _boundsTransform = { a:1.0, b:0.0, c:0.0, d:1.0, tx:-origin.x, ty:-origin.y };
        _inverseBoundsTransform = CGAffineTransformInvert(_boundsTransform);
    }
    else
    {
        _boundsTransform = nil;
        _inverseBoundsTransform = nil;
    }
    var index = _subviews.length;
    while (index--)
    {
        var view = _subviews[index],
            origin = view._frame.origin;
        if (!view._DOMElement.CPDOMDisplayContext) view._DOMElement.CPDOMDisplayContext = []; var __index = view._DOMElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = view._DOMElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = view._DOMElement; CPDOMDisplayServerInstructions[__index + 2] = _boundsTransform; CPDOMDisplayServerInstructions[__index + 3] = origin.x; CPDOMDisplayServerInstructions[__index + 4] = origin.y;;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("setBoundsSize:"), function $CPView__setBoundsSize_(self, _cmd, aSize)
{ with(self)
{
    var size = _bounds.size;
    if ((size.width == aSize.width && size.height == aSize.height))
        return;
    var frameSize = _frame.size;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x /= size.width / frameSize.width;
        origin.y /= size.height / frameSize.height;
    }
    size.width = aSize.width;
    size.height = aSize.height;
    if (!(size.width == frameSize.width && size.height == frameSize.height))
    {
        var origin = _bounds.origin;
        origin.x *= size.width / frameSize.width;
        origin.y *= size.height / frameSize.height;
    }
    if (_postsBoundsChangedNotifications && !_inhibitFrameAndBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("resizeWithOldSuperviewSize:"), function $CPView__resizeWithOldSuperviewSize_(self, _cmd, aSize)
{ with(self)
{
    var mask = objj_msgSend(self, "autoresizingMask");
    if(mask == CPViewNotSizable)
        return;
    var frame = _superview._frame,
        newFrame = { origin: { x:_frame.origin.x, y:_frame.origin.y }, size: { width:_frame.size.width, height:_frame.size.height } },
        dX = ((frame.size.width) - aSize.width) /
            (((mask & CPViewMinXMargin) ? 1 : 0) + (mask & CPViewWidthSizable ? 1 : 0) + (mask & CPViewMaxXMargin ? 1 : 0)),
        dY = ((frame.size.height) - aSize.height) /
            ((mask & CPViewMinYMargin ? 1 : 0) + (mask & CPViewHeightSizable ? 1 : 0) + (mask & CPViewMaxYMargin ? 1 : 0));
    if (mask & CPViewMinXMargin)
        newFrame.origin.x += dX;
    if (mask & CPViewWidthSizable)
        newFrame.size.width += dX;
    if (mask & CPViewMinYMargin)
        newFrame.origin.y += dY;
    if (mask & CPViewHeightSizable)
        newFrame.size.height += dY;
    objj_msgSend(self, "setFrame:", newFrame);
}
}), new objj_method(sel_getUid("resizeSubviewsWithOldSize:"), function $CPView__resizeSubviewsWithOldSize_(self, _cmd, aSize)
{ with(self)
{
    var count = _subviews.length;
    while (count--)
        objj_msgSend(_subviews[count], "resizeWithOldSuperviewSize:", aSize);
}
}), new objj_method(sel_getUid("setAutoresizesSubviews:"), function $CPView__setAutoresizesSubviews_(self, _cmd, aFlag)
{ with(self)
{
    _autoresizesSubviews = !!aFlag;
}
}), new objj_method(sel_getUid("autoresizesSubviews"), function $CPView__autoresizesSubviews(self, _cmd)
{ with(self)
{
    return _autoresizesSubviews;
}
}), new objj_method(sel_getUid("setAutoresizingMask:"), function $CPView__setAutoresizingMask_(self, _cmd, aMask)
{ with(self)
{
    _autoresizingMask = aMask;
}
}), new objj_method(sel_getUid("autoresizingMask"), function $CPView__autoresizingMask(self, _cmd)
{ with(self)
{
    return _autoresizingMask;
}
}), new objj_method(sel_getUid("enterFullScreenMode"), function $CPView__enterFullScreenMode(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "enterFullScreenMode:withOptions:", nil, nil);
}
}), new objj_method(sel_getUid("enterFullScreenMode:withOptions:"), function $CPView__enterFullScreenMode_withOptions_(self, _cmd, aScreen, options)
{ with(self)
{
    _fullScreenModeState = _CPViewFullScreenModeStateMake(self);
    var fullScreenWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", objj_msgSend(objj_msgSend(CPDOMWindowBridge, "sharedDOMWindowBridge"), "contentBounds"), CPBorderlessWindowMask);
    objj_msgSend(fullScreenWindow, "setLevel:", CPScreenSaverWindowLevel);
    objj_msgSend(fullScreenWindow, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    var contentView = objj_msgSend(fullScreenWindow, "contentView");
    objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "blackColor"));
    objj_msgSend(contentView, "addSubview:", self);
    objj_msgSend(self, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(self, "setFrame:", CGRectMakeCopy(objj_msgSend(contentView, "bounds")));
    objj_msgSend(fullScreenWindow, "makeKeyAndOrderFront:", self);
    objj_msgSend(fullScreenWindow, "makeFirstResponder:", self);
    _isInFullScreenMode = YES;
    return YES;
}
}), new objj_method(sel_getUid("exitFullScreenMode"), function $CPView__exitFullScreenMode(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "exitFullScreenModeWithOptions:", nil);
}
}), new objj_method(sel_getUid("exitFullScreenModeWithOptions:"), function $CPView__exitFullScreenModeWithOptions_(self, _cmd, options)
{ with(self)
{
    if (!_isInFullScreenMode)
        return;
    _isInFullScreenMode = NO;
    objj_msgSend(self, "setFrame:", _fullScreenModeState.frame);
    objj_msgSend(self, "setAutoresizingMask:", _fullScreenModeState.autoresizingMask);
    objj_msgSend(_fullScreenModeState.superview, "_insertSubview:atIndex:", self, _fullScreenModeState.index);
    objj_msgSend(objj_msgSend(self, "window"), "orderOut:", self);
}
}), new objj_method(sel_getUid("isInFullScreenMode"), function $CPView__isInFullScreenMode(self, _cmd)
{ with(self)
{
    return _isInFullScreenMode;
}
}), new objj_method(sel_getUid("setHidden:"), function $CPView__setHidden_(self, _cmd, aFlag)
{ with(self)
{
    aFlag = !!aFlag;
    if(_isHidden === aFlag)
        return;
    _isHidden = aFlag;
    _DOMElement.style.display = _isHidden ? "none" : "block";
    if (aFlag)
    {
        var view = objj_msgSend(_window, "firstResponder");
        if (objj_msgSend(view, "isKindOfClass:", objj_msgSend(CPView, "class")))
        {
            do
            {
               if (self == view)
               {
                  objj_msgSend(_window, "makeFirstResponder:", objj_msgSend(self, "nextValidKeyView"));
                  break;
               }
            }
            while (view = objj_msgSend(view, "superview"));
        }
    }
}
}), new objj_method(sel_getUid("isHidden"), function $CPView__isHidden(self, _cmd)
{ with(self)
{
    return _isHidden;
}
}), new objj_method(sel_getUid("setAlphaValue:"), function $CPView__setAlphaValue_(self, _cmd, anAlphaValue)
{ with(self)
{
    if (_opacity == anAlphaValue)
        return;
    _opacity = anAlphaValue;
    if (CPFeatureIsCompatible(CPOpacityRequiresFilterFeature))
    {
        if (anAlphaValue == 1.0)
            try { _DOMElement.style.removeAttribute("filter") } catch (anException) { }
        else
            _DOMElement.style.filter = "alpha(opacity=" + anAlphaValue * 100 + ")";
    }
    else
        _DOMElement.style.opacity = anAlphaValue;
}
}), new objj_method(sel_getUid("alphaValue"), function $CPView__alphaValue(self, _cmd)
{ with(self)
{
    return _opacity;
}
}), new objj_method(sel_getUid("isHiddenOrHasHiddenAncestor"), function $CPView__isHiddenOrHasHiddenAncestor(self, _cmd)
{ with(self)
{
    var view = self;
    while (view && !objj_msgSend(view, "isHidden"))
        view = objj_msgSend(view, "superview");
    return view !== nil;
}
}), new objj_method(sel_getUid("acceptsFirstMouse:"), function $CPView__acceptsFirstMouse_(self, _cmd, anEvent)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("hitTests"), function $CPView__hitTests(self, _cmd)
{ with(self)
{
    return _hitTests;
}
}), new objj_method(sel_getUid("setHitTests:"), function $CPView__setHitTests_(self, _cmd, shouldHitTest)
{ with(self)
{
    _hitTests = !!shouldHitTest;
}
}), new objj_method(sel_getUid("hitTest:"), function $CPView__hitTest_(self, _cmd, aPoint)
{ with(self)
{
    if(_isHidden || !_hitTests || !CPRectContainsPoint(_frame, aPoint))
        return nil;
    var view = nil,
        i = _subviews.length,
        adjustedPoint = { x:aPoint.x - (_frame.origin.x), y:aPoint.y - (_frame.origin.y) };
    if (_inverseBoundsTransform)
        adjustedPoint = { x:adjustedPoint.x * _inverseBoundsTransform.a + adjustedPoint.y * _inverseBoundsTransform.c + _inverseBoundsTransform.tx, y:adjustedPoint.x * _inverseBoundsTransform.b + adjustedPoint.y * _inverseBoundsTransform.d + _inverseBoundsTransform.ty };
    while (i--)
        if (view = objj_msgSend(_subviews[i], "hitTest:", adjustedPoint))
            return view;
    return self;
}
}), new objj_method(sel_getUid("mouseDownCanMoveWindow"), function $CPView__mouseDownCanMoveWindow(self, _cmd)
{ with(self)
{
    return !objj_msgSend(self, "isOpaque");
}
}), new objj_method(sel_getUid("mouseDown:"), function $CPView__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    if (objj_msgSend(self, "mouseDownCanMoveWindow"))
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "mouseDown:", anEvent);
}
}), new objj_method(sel_getUid("setBackgroundColor:"), function $CPView__setBackgroundColor_(self, _cmd, aColor)
{ with(self)
{
    if (_backgroundColor == aColor)
        return;
    _backgroundColor = aColor;
    var patternImage = objj_msgSend(_backgroundColor, "patternImage"),
        amount = 0;
    if (objj_msgSend(patternImage, "isThreePartImage"))
    {
        _backgroundType = objj_msgSend(patternImage, "isVertical") ? BackgroundVerticalThreePartImage : BackgroundHorizontalThreePartImage;
        amount = 3 - _DOMImageParts.length;
    }
    else if (objj_msgSend(patternImage, "isNinePartImage"))
    {
        _backgroundType = BackgroundNinePartImage;
        amount = 9 - _DOMImageParts.length;
    }
    else
    {
        _backgroundType = BackgroundTrivialColor;
        amount = 0 - _DOMImageParts.length;
    }
    if (amount > 0)
        while (amount--)
        {
            var DOMElement = DOMElementPrototype.cloneNode(false);
            DOMElement.style.zIndex = -1000;
            _DOMImageParts.push(DOMElement);
            _DOMElement.appendChild(DOMElement);
        }
    else
    {
        amount = -amount;
        while (amount--)
            _DOMElement.removeChild(_DOMImageParts.pop());
    }
    if (_backgroundType == BackgroundTrivialColor)
        _DOMElement.style.background = _backgroundColor ? objj_msgSend(_backgroundColor, "cssString") : "";
    else
    {
        var slices = objj_msgSend(patternImage, "imageSlices"),
            count = slices.length,
            frameSize = _frame.size;
        while (count--)
        {
            var image = slices[count],
                size = _DOMImageSizes[count] = image ? objj_msgSend(image, "size") : { width:0.0, height:0.0 };
            if (!_DOMImageParts[count].CPDOMDisplayContext) _DOMImageParts[count].CPDOMDisplayContext = []; var __index = _DOMImageParts[count].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[count].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[count]; CPDOMDisplayServerInstructions[__index + 2] = size.width; CPDOMDisplayServerInstructions[__index + 3] = size.height;;
            _DOMImageParts[count].style.background = image ? "url(\"" + objj_msgSend(image, "filename") + "\")" : "";
        }
        if (_backgroundType == BackgroundNinePartImage)
        {
            var width = frameSize.width - _DOMImageSizes[0].width - _DOMImageSizes[2].width,
                height = frameSize.height - _DOMImageSizes[0].height - _DOMImageSizes[6].height;
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[0].height;;
            if (!_DOMImageParts[3].CPDOMDisplayContext) _DOMImageParts[3].CPDOMDisplayContext = []; var __index = _DOMImageParts[3].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[3].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[3]; CPDOMDisplayServerInstructions[__index + 2] = _DOMImageSizes[3].width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[4].CPDOMDisplayContext) _DOMImageParts[4].CPDOMDisplayContext = []; var __index = _DOMImageParts[4].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[4].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[4]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[5].CPDOMDisplayContext) _DOMImageParts[5].CPDOMDisplayContext = []; var __index = _DOMImageParts[5].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[5].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[5]; CPDOMDisplayServerInstructions[__index + 2] = _DOMImageSizes[5].width; CPDOMDisplayServerInstructions[__index + 3] = height;;
            if (!_DOMImageParts[7].CPDOMDisplayContext) _DOMImageParts[7].CPDOMDisplayContext = []; var __index = _DOMImageParts[7].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[7].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[7]; CPDOMDisplayServerInstructions[__index + 2] = width; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[7].height;;
            if (!_DOMImageParts[0].CPDOMDisplayContext) _DOMImageParts[0].CPDOMDisplayContext = []; var __index = _DOMImageParts[0].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[0].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[0]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[0].width; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[2].CPDOMDisplayContext) _DOMImageParts[2].CPDOMDisplayContext = []; var __index = _DOMImageParts[2].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[2].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 1; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[2]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[3].CPDOMDisplayContext) _DOMImageParts[3].CPDOMDisplayContext = []; var __index = _DOMImageParts[3].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[3].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[3]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = _DOMImageSizes[1].height;;
            if (!_DOMImageParts[4].CPDOMDisplayContext) _DOMImageParts[4].CPDOMDisplayContext = []; var __index = _DOMImageParts[4].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[4].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[4]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[0].width; CPDOMDisplayServerInstructions[__index + 4] = _DOMImageSizes[0].height;;
            if (!_DOMImageParts[5].CPDOMDisplayContext) _DOMImageParts[5].CPDOMDisplayContext = []; var __index = _DOMImageParts[5].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[5].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 1; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[5]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = _DOMImageSizes[1].height;;
            if (!_DOMImageParts[6].CPDOMDisplayContext) _DOMImageParts[6].CPDOMDisplayContext = []; var __index = _DOMImageParts[6].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[6].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 2; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[6]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[7].CPDOMDisplayContext) _DOMImageParts[7].CPDOMDisplayContext = []; var __index = _DOMImageParts[7].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[7].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 2; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[7]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[6].width; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[8].CPDOMDisplayContext) _DOMImageParts[8].CPDOMDisplayContext = []; var __index = _DOMImageParts[8].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[8].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 3; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[8]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
        }
        else if (_backgroundType == BackgroundVerticalThreePartImage)
        {
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = frameSize.width; CPDOMDisplayServerInstructions[__index + 3] = frameSize.height - _DOMImageSizes[0].height - _DOMImageSizes[2].height;;
            if (!_DOMImageParts[0].CPDOMDisplayContext) _DOMImageParts[0].CPDOMDisplayContext = []; var __index = _DOMImageParts[0].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[0].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[0]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = _DOMImageSizes[0].height;;
            if (!_DOMImageParts[2].CPDOMDisplayContext) _DOMImageParts[2].CPDOMDisplayContext = []; var __index = _DOMImageParts[2].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[2].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 2; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[2]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
        }
        else if (_backgroundType == BackgroundHorizontalThreePartImage)
        {
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = frameSize.width - _DOMImageSizes[0].width - _DOMImageSizes[2].width; CPDOMDisplayServerInstructions[__index + 3] = frameSize.height;;
            if (!_DOMImageParts[0].CPDOMDisplayContext) _DOMImageParts[0].CPDOMDisplayContext = []; var __index = _DOMImageParts[0].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[0].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[0]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[1].CPDOMDisplayContext) _DOMImageParts[1].CPDOMDisplayContext = []; var __index = _DOMImageParts[1].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[1].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[1]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = _DOMImageSizes[0].width; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
            if (!_DOMImageParts[2].CPDOMDisplayContext) _DOMImageParts[2].CPDOMDisplayContext = []; var __index = _DOMImageParts[2].CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMImageParts[2].CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 1; CPDOMDisplayServerInstructions[__index + 1] = _DOMImageParts[2]; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = 0.0; CPDOMDisplayServerInstructions[__index + 4] = 0.0;;
        }
    }
}
}), new objj_method(sel_getUid("backgroundColor"), function $CPView__backgroundColor(self, _cmd)
{ with(self)
{
    return _backgroundColor;
}
}), new objj_method(sel_getUid("convertPoint:fromView:"), function $CPView__convertPoint_fromView_(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertPoint:toView:"), function $CPView__convertPoint_toView_(self, _cmd, aPoint, aView)
{ with(self)
{
    return CGPointApplyAffineTransform(aPoint, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertSize:fromView:"), function $CPView__convertSize_fromView_(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertSize:toView:"), function $CPView__convertSize_toView_(self, _cmd, aSize, aView)
{ with(self)
{
    return CGSizeApplyAffineTransform(aSize, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("convertRect:fromView:"), function $CPView__convertRect_fromView_(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(aView, self));
}
}), new objj_method(sel_getUid("convertRect:toView:"), function $CPView__convertRect_toView_(self, _cmd, aRect, aView)
{ with(self)
{
    return CGRectApplyAffineTransform(aRect, _CPViewGetTransform(self, aView));
}
}), new objj_method(sel_getUid("setPostsFrameChangedNotifications:"), function $CPView__setPostsFrameChangedNotifications_(self, _cmd, shouldPostFrameChangedNotifications)
{ with(self)
{
    shouldPostFrameChangedNotifications = !!shouldPostFrameChangedNotifications;
    if (_postsFrameChangedNotifications === shouldPostFrameChangedNotifications)
        return;
    _postsFrameChangedNotifications = shouldPostFrameChangedNotifications;
    if (_postsFrameChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewFrameDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsFrameChangedNotifications"), function $CPView__postsFrameChangedNotifications(self, _cmd)
{ with(self)
{
    return _postsFrameChangedNotifications;
}
}), new objj_method(sel_getUid("setPostsBoundsChangedNotifications:"), function $CPView__setPostsBoundsChangedNotifications_(self, _cmd, shouldPostBoundsChangedNotifications)
{ with(self)
{
    shouldPostBoundsChangedNotifications = !!shouldPostBoundsChangedNotifications;
    if (_postsBoundsChangedNotifications === shouldPostBoundsChangedNotifications)
        return;
    _postsBoundsChangedNotifications = shouldPostBoundsChangedNotifications;
    if (_postsBoundsChangedNotifications)
        objj_msgSend(CachedNotificationCenter, "postNotificationName:object:", CPViewBoundsDidChangeNotification, self);
}
}), new objj_method(sel_getUid("postsBoundsChangedNotifications"), function $CPView__postsBoundsChangedNotifications(self, _cmd)
{ with(self)
{
    return _postsBoundsChangedNotifications;
}
}), new objj_method(sel_getUid("dragImage:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragImage_at_offset_event_pasteboard_source_slideBack_(self, _cmd, anImage, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragImage:at:offset:event:pasteboard:source:slideBack:", anImage, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("dragView:at:offset:event:pasteboard:source:slideBack:"), function $CPView__dragView_at_offset_event_pasteboard_source_slideBack_(self, _cmd, aView, aLocation, mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack)
{ with(self)
{
    objj_msgSend(_window, "dragView:at:offset:event:pasteboard:source:slideBack:", aView, objj_msgSend(self, "convertPoint:toView:", aLocation, nil), mouseOffset, anEvent, aPasteboard, aSourceObject, slideBack);
}
}), new objj_method(sel_getUid("registerForDraggedTypes:"), function $CPView__registerForDraggedTypes_(self, _cmd, pasteboardTypes)
{ with(self)
{
    if (!pasteboardTypes)
        return;
    var theWindow = objj_msgSend(self, "window");
    objj_msgSend(theWindow, "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    objj_msgSend(_registeredDraggedTypes, "addObjectsFromArray:", pasteboardTypes)
    objj_msgSend(theWindow, "_noteRegisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypesArray = nil;
}
}), new objj_method(sel_getUid("registeredDraggedTypes"), function $CPView__registeredDraggedTypes(self, _cmd)
{ with(self)
{
    if (!_registeredDraggedTypesArray)
        _registeredDraggedTypesArray = objj_msgSend(_registeredDraggedTypes, "allObjects");
    return _registeredDraggedTypesArray;
}
}), new objj_method(sel_getUid("unregisterDraggedTypes"), function $CPView__unregisterDraggedTypes(self, _cmd)
{ with(self)
{
    objj_msgSend(objj_msgSend(self, "window"), "_noteUnregisteredDraggedTypes:", _registeredDraggedTypes);
    _registeredDraggedTypes = objj_msgSend(CPSet, "set");
    _registeredDraggedTypesArray = [];
}
}), new objj_method(sel_getUid("drawRect:"), function $CPView__drawRect_(self, _cmd, aRect)
{ with(self)
{
}
}), new objj_method(sel_getUid("setNeedsDisplay:"), function $CPView__setNeedsDisplay_(self, _cmd, aFlag)
{ with(self)
{
    if (aFlag)
        objj_msgSend(self, "setNeedsDisplayInRect:", objj_msgSend(self, "bounds"));
    else
        { var index = CPDOMDisplayServerViewsContext[objj_msgSend(self, "hash")]; if (typeof index != "undefined") { CPDOMDisplayServerViewsContext[objj_msgSend(self, "hash")]; CPDOMDisplayServerViews[index] = NULL; } };
}
}), new objj_method(sel_getUid("setNeedsDisplayInRect:"), function $CPView__setNeedsDisplayInRect_(self, _cmd, aRect)
{ with(self)
{
    var hash = objj_msgSend(objj_msgSend(self, "class"), "hash"),
        hasCustomDrawRect = CustomDrawRectViews[hash];
    if (!hasCustomDrawRect && typeof hasCustomDrawRect === "undefined")
    {
        hasCustomDrawRect = objj_msgSend(self, "methodForSelector:", sel_getUid("drawRect:")) != objj_msgSend(CPView, "instanceMethodForSelector:", sel_getUid("drawRect:"));
        CustomDrawRectViews[hash] = hasCustomDrawRect;
    }
    if (!hasCustomDrawRect)
        return;
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0))
        return;
    if (_dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0))
        _dirtyRect = CGRectUnion(aRect, _dirtyRect);
    else
        _dirtyRect = { origin: { x:aRect.origin.x, y:aRect.origin.y }, size: { width:aRect.size.width, height:aRect.size.height } };
    { var ___hash = objj_msgSend(self, "hash"); if (typeof (CPDOMDisplayServerViewsContext[___hash]) == "undefined") { CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++] = self; CPDOMDisplayServerViewsContext[___hash] = self; } };
}
}), new objj_method(sel_getUid("needsDisplay"), function $CPView__needsDisplay(self, _cmd)
{ with(self)
{
    return _dirtyRect && !(_dirtyRect.size.width <= 0.0 || _dirtyRect.size.height <= 0.0);
}
}), new objj_method(sel_getUid("displayIfNeeded"), function $CPView__displayIfNeeded(self, _cmd)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", _dirtyRect);
}
}), new objj_method(sel_getUid("display"), function $CPView__display(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "displayRect:", objj_msgSend(self, "visibleRect"));
}
}), new objj_method(sel_getUid("displayIfNeededInRect:"), function $CPView__displayIfNeededInRect_(self, _cmd, aRect)
{ with(self)
{
    if (objj_msgSend(self, "needsDisplay"))
        objj_msgSend(self, "displayRect:", aRect);
}
}), new objj_method(sel_getUid("displayRect:"), function $CPView__displayRect_(self, _cmd, aRect)
{ with(self)
{
    objj_msgSend(self, "viewWillDraw");
    objj_msgSend(self, "displayRectIgnoringOpacity:inContext:", aRect, nil);
    _dirtyRect = NULL;
}
}), new objj_method(sel_getUid("displayRectIgnoringOpacity:inContext:"), function $CPView__displayRectIgnoringOpacity_inContext_(self, _cmd, aRect, aGraphicsContext)
{ with(self)
{
    objj_msgSend(self, "lockFocus");
    CGContextClearRect(objj_msgSend(objj_msgSend(CPGraphicsContext, "currentContext"), "graphicsPort"), aRect);
    objj_msgSend(self, "drawRect:", aRect);
    objj_msgSend(self, "unlockFocus");
}
}), new objj_method(sel_getUid("viewWillDraw"), function $CPView__viewWillDraw(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("lockFocus"), function $CPView__lockFocus(self, _cmd)
{ with(self)
{
    if (!_graphicsContext)
    {
        var graphicsPort = CGBitmapGraphicsContextCreate();
        _DOMContentsElement = graphicsPort.DOMElement;
        _DOMContentsElement.style.zIndex = -100;
        _DOMContentsElement.style.overflow = "hidden";
        _DOMContentsElement.style.position = "absolute";
        _DOMContentsElement.style.visibility = "visible";
        _DOMContentsElement.width = ROUND((_frame.size.width));
        _DOMContentsElement.height = ROUND((_frame.size.height));
        _DOMContentsElement.style.top = "0px";
        _DOMContentsElement.style.left = "0px";
        _DOMContentsElement.style.width = ROUND((_frame.size.width)) + "px";
        _DOMContentsElement.style.height = ROUND((_frame.size.height)) + "px";
        if (_DOMContentsElement.CPDOMDisplayContext) _DOMContentsElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMContentsElement;;
        _graphicsContext = objj_msgSend(CPGraphicsContext, "graphicsContextWithGraphicsPort:flipped:", graphicsPort, YES);
    }
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", _graphicsContext);
    CGContextSaveGState(objj_msgSend(_graphicsContext, "graphicsPort"));
}
}), new objj_method(sel_getUid("unlockFocus"), function $CPView__unlockFocus(self, _cmd)
{ with(self)
{
    CGContextRestoreGState(objj_msgSend(_graphicsContext, "graphicsPort"));
    objj_msgSend(CPGraphicsContext, "setCurrentContext:", nil);
}
}), new objj_method(sel_getUid("setNeedsLayout"), function $CPView__setNeedsLayout(self, _cmd)
{ with(self)
{
    _needsLayout = YES;
    var hash = objj_msgSend(objj_msgSend(self, "class"), "hash"),
        hasCustomLayoutSubviews = CustomLayoutSubviewsViews[hash];
    if (hasCustomLayoutSubviews === undefined)
    {
        hasCustomLayoutSubviews = objj_msgSend(self, "methodForSelector:", sel_getUid("layoutSubviews")) != objj_msgSend(CPView, "instanceMethodForSelector:", sel_getUid("layoutSubviews"));
        CustomLayoutSubviewsViews[hash] = hasCustomLayoutSubviews;
    }
    if (!hasCustomLayoutSubviews)
        return;
    if (_needsLayout)
    {
        { var ___hash = objj_msgSend(self, "hash"); if (typeof (CPDOMDisplayServerViewsContext[___hash]) == "undefined") { CPDOMDisplayServerViews[CPDOMDisplayServerViewsCount++] = self; CPDOMDisplayServerViewsContext[___hash] = self; } };
    }
}
}), new objj_method(sel_getUid("layoutIfNeeded"), function $CPView__layoutIfNeeded(self, _cmd)
{ with(self)
{
    if (_needsLayout)
    {
        _needsLayout = NO;
        objj_msgSend(self, "layoutSubviews");
    }
}
}), new objj_method(sel_getUid("layoutSubviews"), function $CPView__layoutSubviews(self, _cmd)
{ with(self)
{
}
}), new objj_method(sel_getUid("isOpaque"), function $CPView__isOpaque(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("visibleRect"), function $CPView__visibleRect(self, _cmd)
{ with(self)
{
    if (!_superview)
        return _bounds;
    return CGRectIntersection(objj_msgSend(self, "convertRect:fromView:", objj_msgSend(_superview, "visibleRect"), _superview), _bounds);
}
}), new objj_method(sel_getUid("_enclosingClipView"), function $CPView___enclosingClipView(self, _cmd)
{ with(self)
{
    var superview = _superview,
        clipViewClass = objj_msgSend(CPClipView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", clipViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollPoint:"), function $CPView__scrollPoint_(self, _cmd, aPoint)
{ with(self)
{
    var clipView = objj_msgSend(self, "_enclosingClipView");
    if (!clipView)
        return;
    objj_msgSend(clipView, "scrollToPoint:", objj_msgSend(self, "convertPoint:toView:", aPoint, clipView));
}
}), new objj_method(sel_getUid("scrollRectToVisible:"), function $CPView__scrollRectToVisible_(self, _cmd, aRect)
{ with(self)
{
    var visibleRect = objj_msgSend(self, "visibleRect");
    aRect = CGRectIntersection(aRect, _bounds);
    if ((aRect.size.width <= 0.0 || aRect.size.height <= 0.0) || CGRectContainsRect(visibleRect, aRect))
        return NO;
    var enclosingClipView = objj_msgSend(self, "_enclosingClipView");
    if (!enclosingClipView)
        return NO;
    var scrollPoint = { x:visibleRect.origin.x, y:visibleRect.origin.y };
    if ((aRect.origin.x) <= (visibleRect.origin.x))
        scrollPoint.x = (aRect.origin.x);
    else if ((aRect.origin.x + aRect.size.width) > (visibleRect.origin.x + visibleRect.size.width))
        scrollPoint.x += (aRect.origin.x + aRect.size.width) - (visibleRect.origin.x + visibleRect.size.width);
    if ((aRect.origin.y) <= (visibleRect.origin.y))
        scrollPoint.y = CGRectGetMinY(aRect);
    else if ((aRect.origin.y + aRect.size.height) > (visibleRect.origin.y + visibleRect.size.height))
        scrollPoint.y += (aRect.origin.y + aRect.size.height) - (visibleRect.origin.y + visibleRect.size.height);
    objj_msgSend(enclosingClipView, "scrollToPoint:", CGPointMake(scrollPoint.x, scrollPoint.y));
    return YES;
}
}), new objj_method(sel_getUid("autoscroll:"), function $CPView__autoscroll_(self, _cmd, anEvent)
{ with(self)
{
    return objj_msgSend(objj_msgSend(self, "superview"), "autoscroll:", anEvent);
}
}), new objj_method(sel_getUid("adjustScroll:"), function $CPView__adjustScroll_(self, _cmd, proposedVisibleRect)
{ with(self)
{
    return proposedVisibleRect;
}
}), new objj_method(sel_getUid("scrollRect:by:"), function $CPView__scrollRect_by_(self, _cmd, aRect, anAmount)
{ with(self)
{
}
}), new objj_method(sel_getUid("enclosingScrollView"), function $CPView__enclosingScrollView(self, _cmd)
{ with(self)
{
    var superview = _superview,
        scrollViewClass = objj_msgSend(CPScrollView, "class");
    while(superview && !objj_msgSend(superview, "isKindOfClass:", scrollViewClass))
        superview = superview._superview;
    return superview;
}
}), new objj_method(sel_getUid("scrollClipView:toPoint:"), function $CPView__scrollClipView_toPoint_(self, _cmd, aClipView, aPoint)
{ with(self)
{
    objj_msgSend(aClipView, "scrollToPoint:", aPoint);
}
}), new objj_method(sel_getUid("reflectScrolledClipView:"), function $CPView__reflectScrolledClipView_(self, _cmd, aClipView)
{ with(self)
{
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPView__initialize(self, _cmd)
{ with(self)
{
    if (self !== objj_msgSend(CPView, "class"))
        return;
    DOMElementPrototype = document.createElement("div");
    var style = DOMElementPrototype.style;
    style.overflow = "hidden";
    style.position = "absolute";
    style.visibility = "visible";
    style.zIndex = 0;
    CachedNotificationCenter = objj_msgSend(CPNotificationCenter, "defaultCenter");
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("canBecomeKeyView"), function $CPView__canBecomeKeyView(self, _cmd)
{ with(self)
{
    return objj_msgSend(self, "acceptsFirstResponder") && !objj_msgSend(self, "isHiddenOrHasHiddenAncestor");
}
}), new objj_method(sel_getUid("nextKeyView"), function $CPView__nextKeyView(self, _cmd)
{ with(self)
{
    return _nextKeyView;
}
}), new objj_method(sel_getUid("nextValidKeyView"), function $CPView__nextValidKeyView(self, _cmd)
{ with(self)
{
    var result = objj_msgSend(self, "nextKeyView");
    while (result && !objj_msgSend(result, "canBecomeKeyView"))
        result = objj_msgSend(result, "nextKeyView");
    return result;
}
}), new objj_method(sel_getUid("previousKeyView"), function $CPView__previousKeyView(self, _cmd)
{ with(self)
{
    return _previousKeyView;
}
}), new objj_method(sel_getUid("previousValidKeyView"), function $CPView__previousValidKeyView(self, _cmd)
{ with(self)
{
    var result = objj_msgSend(self, "previousKeyView");
    while (result && !objj_msgSend(result, "canBecomeKeyView"))
        result = objj_msgSend(result, "previousKeyView");
    return result;
}
}), new objj_method(sel_getUid("_setPreviousKeyView:"), function $CPView___setPreviousKeyView_(self, _cmd, previous)
{ with(self)
{
    _previousKeyView = previous;
}
}), new objj_method(sel_getUid("setNextKeyView:"), function $CPView__setNextKeyView_(self, _cmd, next)
{ with(self)
{
    _nextKeyView = next;
    objj_msgSend(_nextKeyView, "_setPreviousKeyView:", self);
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("setLayer:"), function $CPView__setLayer_(self, _cmd, aLayer)
{ with(self)
{
    if (_layer == aLayer)
        return;
    if (_layer)
    {
        _layer._owningView = nil;
        _DOMElement.removeChild(_layer._DOMElement);
    }
    _layer = aLayer;
    if (_layer)
    {
        var bounds = CGRectMakeCopy(objj_msgSend(self, "bounds"));
        objj_msgSend(_layer, "_setOwningView:", self);
        _layer._DOMElement.style.zIndex = 100;
        _DOMElement.appendChild(_layer._DOMElement);
    }
}
}), new objj_method(sel_getUid("layer"), function $CPView__layer(self, _cmd)
{ with(self)
{
    return _layer;
}
}), new objj_method(sel_getUid("setWantsLayer:"), function $CPView__setWantsLayer_(self, _cmd, aFlag)
{ with(self)
{
    _wantsLayer = !!aFlag;
}
}), new objj_method(sel_getUid("wantsLayer"), function $CPView__wantsLayer(self, _cmd)
{ with(self)
{
    return _wantsLayer;
}
})]);
}
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("themeState"), function $CPView__themeState(self, _cmd)
{ with(self)
{
    return _themeState;
}
}), new objj_method(sel_getUid("hasThemeState:"), function $CPView__hasThemeState_(self, _cmd, aState)
{ with(self)
{
    return !!(_themeState & ((typeof aState === "string") ? CPThemeState(aState) : aState));
}
}), new objj_method(sel_getUid("setThemeState:"), function $CPView__setThemeState_(self, _cmd, aState)
{ with(self)
{
    var newState = (typeof aState === "string") ? CPThemeState(aState) : aState;
    if (_themeState & newState)
        return NO;
    _themeState |= newState;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
}), new objj_method(sel_getUid("unsetThemeState:"), function $CPView__unsetThemeState_(self, _cmd, aState)
{ with(self)
{
    var newState = ((typeof aState === "string") ? CPThemeState(aState) : aState);
    if (!(_themeState & newState))
        return NO;
    _themeState &= ~newState;
    objj_msgSend(self, "setNeedsLayout");
    objj_msgSend(self, "setNeedsDisplay:", YES);
    return YES;
}
}), new objj_method(sel_getUid("_loadThemeAttributes"), function $CPView___loadThemeAttributes(self, _cmd)
{ with(self)
{
    var theClass = objj_msgSend(self, "class"),
        attributes = objj_msgSend(theClass, "_themeAttributes"),
        count = attributes.length;
    if (!count)
        return;
    var theme = objj_msgSend(self, "theme"),
        themeClass = objj_msgSend(theClass, "themeClass");
    _themeAttributes = {};
    while (count--)
    {
        var attributeName = attributes[count--],
            attribute = objj_msgSend(objj_msgSend(_CPThemeAttribute, "alloc"), "initWithName:defaultValue:", attributeName, attributes[count]);
        objj_msgSend(attribute, "setParentAttribute:", objj_msgSend(theme, "_attributeWithName:forClass:", attributeName, themeClass));
        _themeAttributes[attributeName] = attribute;
    }
}
}), new objj_method(sel_getUid("setTheme:"), function $CPView__setTheme_(self, _cmd, aTheme)
{ with(self)
{
    if (_theme === aTheme)
        return;
    _theme = aTheme;
    objj_msgSend(self, "viewDidChangeTheme");
}
}), new objj_method(sel_getUid("theme"), function $CPView__theme(self, _cmd)
{ with(self)
{
    return _theme;
}
}), new objj_method(sel_getUid("viewDidChangeTheme"), function $CPView__viewDidChangeTheme(self, _cmd)
{ with(self)
{
    if (!_themeAttributes)
        return;
    var theme = objj_msgSend(self, "theme"),
        themeClass = objj_msgSend(objj_msgSend(self, "class"), "themeClass");
    for (var attributeName in _themeAttributes)
        if (_themeAttributes.hasOwnProperty(attributeName))
            objj_msgSend(_themeAttributes[attributeName], "setParentAttribute:", objj_msgSend(theme, "_attributeWithName:forClass:", attributeName, themeClass));
}
}), new objj_method(sel_getUid("_themeAttributeDictionary"), function $CPView___themeAttributeDictionary(self, _cmd)
{ with(self)
{
    var dictionary = objj_msgSend(CPDictionary, "dictionary");
    if (_themeAttributes)
    {
        var theme = objj_msgSend(self, "theme");
        for (var attributeName in _themeAttributes)
            if (_themeAttributes.hasOwnProperty(attributeName))
                objj_msgSend(dictionary, "setObject:forKey:", _themeAttributes[attributeName], attributeName);
    }
    return dictionary;
}
}), new objj_method(sel_getUid("setValue:forThemeAttribute:inState:"), function $CPView__setValue_forThemeAttribute_inState_(self, _cmd, aValue, aName, aState)
{ with(self)
{
    if (!_themeAttributes || !_themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = objj_msgSend(self, "currentValueForThemeAttribute:", aName);
    objj_msgSend(_themeAttributes[aName], "setValue:forState:", aValue, aState);
    if (objj_msgSend(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("setValue:forThemeAttribute:"), function $CPView__setValue_forThemeAttribute_(self, _cmd, aValue, aName)
{ with(self)
{
    if (!_themeAttributes || !_themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    var currentValue = objj_msgSend(self, "currentValueForThemeAttribute:", aName);
    objj_msgSend(_themeAttributes[aName], "setValue:", aValue);
    if (objj_msgSend(self, "currentValueForThemeAttribute:", aName) === currentValue)
        return;
    objj_msgSend(self, "setNeedsDisplay:", YES);
    objj_msgSend(self, "setNeedsLayout");
}
}), new objj_method(sel_getUid("valueForThemeAttribute:inState:"), function $CPView__valueForThemeAttribute_inState_(self, _cmd, aName, aState)
{ with(self)
{
    if (!_themeAttributes || !_themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(_themeAttributes[aName], "valueForState:", aState);
}
}), new objj_method(sel_getUid("valueForThemeAttribute:"), function $CPView__valueForThemeAttribute_(self, _cmd, aName)
{ with(self)
{
    if (!_themeAttributes || !_themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(_themeAttributes[aName], "value");
}
}), new objj_method(sel_getUid("currentValueForThemeAttribute:"), function $CPView__currentValueForThemeAttribute_(self, _cmd, aName)
{ with(self)
{
    if (!_themeAttributes || !_themeAttributes[aName])
        objj_msgSend(CPException, "raise:reason:", CPInvalidArgumentException, objj_msgSend(self, "className") + " does not contain theme attribute '" + aName + "'");
    return objj_msgSend(_themeAttributes[aName], "valueForState:", _themeState);
}
})]);
class_addMethods(meta_class, [new objj_method(sel_getUid("themeClass"), function $CPView__themeClass(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("themeAttributes"), function $CPView__themeAttributes(self, _cmd)
{ with(self)
{
    return nil;
}
}), new objj_method(sel_getUid("_themeAttributes"), function $CPView___themeAttributes(self, _cmd)
{ with(self)
{
    if (!CachedThemeAttributes)
        CachedThemeAttributes = {};
    var theClass = objj_msgSend(self, "class"),
        CPViewClass = objj_msgSend(CPView, "class"),
        attributes = [];
    for (; theClass && theClass !== CPViewClass; theClass = objj_msgSend(theClass, "superclass"))
    {
        var cachedAttributes = CachedThemeAttributes[class_getName(theClass)];
        if (cachedAttributes)
        {
            attributes = attributes.length ? attributes.concat(cachedAttributes) : attributes;
            CachedThemeAttributes[objj_msgSend(self, "className")] = attributes;
            break;
        }
        var attributeDictionary = objj_msgSend(theClass, "themeAttributes");
        if (!attributeDictionary)
            continue;
        var attributeKeys = objj_msgSend(attributeDictionary, "allKeys"),
            attributeCount = attributeKeys.length;
        while (attributeCount--)
        {
            var attributeName = attributeKeys[attributeCount];
            attributes.push(objj_msgSend(attributeDictionary, "objectForKey:", attributeName));
            attributes.push(attributeName);
        }
    }
    return attributes;
}
})]);
}
var CPViewAutoresizingMaskKey = "CPViewAutoresizingMask",
    CPViewAutoresizesSubviewsKey = "CPViewAutoresizesSubviews",
    CPViewBackgroundColorKey = "CPViewBackgroundColor",
    CPViewBoundsKey = "CPViewBoundsKey",
    CPViewFrameKey = "CPViewFrameKey",
    CPViewHitTestsKey = "CPViewHitTestsKey",
    CPViewIsHiddenKey = "CPViewIsHiddenKey",
    CPViewOpacityKey = "CPViewOpacityKey",
    CPViewSubviewsKey = "CPViewSubviewsKey",
    CPViewSuperviewKey = "CPViewSuperviewKey",
    CPViewTagKey = "CPViewTagKey",
    CPViewThemeStateKey = "CPViewThemeStateKey",
    CPViewWindowKey = "CPViewWindowKey",
    CPViewNextKeyViewKey = "CPViewNextKeyViewKey",
    CPViewPreviousKeyViewKey = "CPViewPreviousKeyViewKey";
{
var the_class = objj_getClass("CPView")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPView\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPView__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    _DOMElement = DOMElementPrototype.cloneNode(false);
    _frame = objj_msgSend(aCoder, "decodeRectForKey:", CPViewFrameKey);
    _bounds = objj_msgSend(aCoder, "decodeRectForKey:", CPViewBoundsKey);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "initWithCoder:", aCoder);
    if (self)
    {
        _tag = objj_msgSend(aCoder, "containsValueForKey:", CPViewTagKey) ? objj_msgSend(aCoder, "decodeIntForKey:", CPViewTagKey) : -1;
        _window = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewWindowKey);
        _subviews = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSubviewsKey) || [];
        _superview = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewSuperviewKey);
        _autoresizingMask = objj_msgSend(aCoder, "decodeIntForKey:", CPViewAutoresizingMaskKey) || CPViewNotSizable;
        _autoresizesSubviews = !objj_msgSend(aCoder, "containsValueForKey:", CPViewAutoresizesSubviewsKey) || objj_msgSend(aCoder, "decodeBoolForKey:", CPViewAutoresizesSubviewsKey);
        _hitTests = !objj_msgSend(aCoder, "containsValueForKey:", CPViewHitTestsKey) || objj_msgSend(aCoder, "decodeObjectForKey:", CPViewHitTestsKey);
        _DOMImageParts = [];
        _DOMImageSizes = [];
        if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[0]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[0] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 5; } CPDOMDisplayServerInstructions[__index] = 0; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = NULL; CPDOMDisplayServerInstructions[__index + 3] = (_frame.origin.x); CPDOMDisplayServerInstructions[__index + 4] = (_frame.origin.y);;
        if (!_DOMElement.CPDOMDisplayContext) _DOMElement.CPDOMDisplayContext = []; var __index = _DOMElement.CPDOMDisplayContext[4]; if (!(__index >= 0)) { __index = _DOMElement.CPDOMDisplayContext[4] = CPDOMDisplayServerInstructionCount; CPDOMDisplayServerInstructionCount += 4; } CPDOMDisplayServerInstructions[__index] = 4; CPDOMDisplayServerInstructions[__index + 1] = _DOMElement; CPDOMDisplayServerInstructions[__index + 2] = (_frame.size.width); CPDOMDisplayServerInstructions[__index + 3] = (_frame.size.height);;
        var index = 0,
            count = _subviews.length;
        for (; index < count; ++index)
        {
            if (_subviews[index]._DOMElement.CPDOMDisplayContext) _subviews[index]._DOMElement.CPDOMDisplayContext[0] = -1; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = 6; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _DOMElement; CPDOMDisplayServerInstructions[CPDOMDisplayServerInstructionCount++] = _subviews[index]._DOMElement;;
        }
        _displayHash = objj_msgSend(self, "hash");
        if (objj_msgSend(aCoder, "containsValueForKey:", CPViewIsHiddenKey))
            objj_msgSend(self, "setHidden:", objj_msgSend(aCoder, "decodeBoolForKey:", CPViewIsHiddenKey));
        else
            _isHidden = NO;
        if (objj_msgSend(aCoder, "containsValueForKey:", CPViewOpacityKey))
            objj_msgSend(self, "setAlphaValue:", objj_msgSend(aCoder, "decodeIntForKey:", CPViewOpacityKey));
        else
            _opacity = 1.0;
        objj_msgSend(self, "setBackgroundColor:", objj_msgSend(aCoder, "decodeObjectForKey:", CPViewBackgroundColorKey));
        _theme = objj_msgSend(CPTheme, "defaultTheme");
        _themeState = CPThemeState(objj_msgSend(aCoder, "decodeIntForKey:", CPViewThemeStateKey));
        _themeAttributes = {};
        var theClass = objj_msgSend(self, "class"),
            themeClass = objj_msgSend(theClass, "themeClass"),
            attributes = objj_msgSend(theClass, "_themeAttributes"),
            count = attributes.length;
        while (count--)
        {
            var attributeName = attributes[count--];
            _themeAttributes[attributeName] = CPThemeAttributeDecode(aCoder, attributeName, attributes[count], _theme, themeClass);
        }
        objj_msgSend(self, "setNeedsDisplay:", YES);
    }
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function $CPView__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPResponder") }, "encodeWithCoder:", aCoder);
    if (_tag !== -1)
        objj_msgSend(aCoder, "encodeInt:forKey:", _tag, CPViewTagKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _frame, CPViewFrameKey);
    objj_msgSend(aCoder, "encodeRect:forKey:", _bounds, CPViewBoundsKey);
    if (_window !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _window, CPViewWindowKey);
    if (_subviews.length > 0)
        objj_msgSend(aCoder, "encodeObject:forKey:", _subviews, CPViewSubviewsKey);
    if (_superview !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _superview, CPViewSuperviewKey);
    if (_autoresizingMask !== CPViewNotSizable)
        objj_msgSend(aCoder, "encodeInt:forKey:", _autoresizingMask, CPViewAutoresizingMaskKey);
    if (!_autoresizesSubviews)
        objj_msgSend(aCoder, "encodeBool:forKey:", _autoresizesSubviews, CPViewAutoresizesSubviewsKey);
    if (_backgroundColor !== nil)
        objj_msgSend(aCoder, "encodeObject:forKey:", _backgroundColor, CPViewBackgroundColorKey);
    if (_hitTests !== YES)
        objj_msgSend(aCoder, "encodeBool:forKey:", _hitTests, CPViewHitTestsKey);
    if (_opacity !== 1.0)
        objj_msgSend(aCoder, "encodeFloat:forKey:", _opacity, CPViewOpacityKey);
    if (_isHidden)
        objj_msgSend(aCoder, "encodeBool:forKey:", _isHidden, CPViewIsHiddenKey);
    var nextKeyView = objj_msgSend(self, "nextKeyView");
    if (nextKeyView !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", nextKeyView, CPViewNextKeyViewKey);
    var previousKeyView = objj_msgSend(self, "previousKeyView");
    if (previousKeyView !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", previousKeyView, CPViewPreviousKeyViewKey);
    objj_msgSend(aCoder, "encodeInt:forKey:", CPThemeStateName(_themeState), CPViewThemeStateKey);
    for (var attributeName in _themeAttributes)
        if (_themeAttributes.hasOwnProperty(attributeName))
            CPThemeAttributeEncode(aCoder, _themeAttributes[attributeName]);
}
})]);
}
var _CPViewFullScreenModeStateMake = function(aView)
{
    var superview = aView._superview;
    return { autoresizingMask:aView._autoresizingMask, frame:CGRectMakeCopy(aView._frame), index:(superview ? objj_msgSend(superview._subviews, "indexOfObjectIdenticalTo:", aView) : 0), superview:superview };
}
var _CPViewGetTransform = function( fromView, toView)
{
    var transform = CGAffineTransformMakeIdentity(),
        sameWindow = YES,
        fromWindow = nil,
        toWindow = nil;
    if (fromView)
    {
        var view = fromView;
        while (view && view != toView)
        {
            var frame = view._frame;
            transform.tx += (frame.origin.x);
            transform.ty += (frame.origin.y);
            if (view._boundsTransform)
            {
                var tx = transform.tx * view._boundsTransform.a + transform.ty * view._boundsTransform.c + view._boundsTransform.tx;transform.ty = transform.tx * view._boundsTransform.b + transform.ty * view._boundsTransform.d + view._boundsTransform.ty;transform.tx = tx;var a = transform.a * view._boundsTransform.a + transform.b * view._boundsTransform.c, b = transform.a * view._boundsTransform.b + transform.b * view._boundsTransform.d, c = transform.c * view._boundsTransform.a + transform.d * view._boundsTransform.c;transform.d = transform.c * view._boundsTransform.b + transform.d * view._boundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
            }
            view = view._superview;
        }
        if (view === toView)
            return transform;
        else if (fromView && toView)
        {
            fromWindow = objj_msgSend(fromView, "window");
            toWindow = objj_msgSend(toView, "window");
            if (fromWindow && toWindow && fromWindow !== toWindow)
            {
                sameWindow = NO;
                var frame = objj_msgSend(fromWindow, "frame");
                transform.tx += (frame.origin.x);
                transform.ty += (frame.origin.y);
            }
        }
    }
    var view = toView;
    while (view)
    {
        var frame = view._frame;
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
        if (view._boundsTransform)
        {
            var tx = transform.tx * view._inverseBoundsTransform.a + transform.ty * view._inverseBoundsTransform.c + view._inverseBoundsTransform.tx;transform.ty = transform.tx * view._inverseBoundsTransform.b + transform.ty * view._inverseBoundsTransform.d + view._inverseBoundsTransform.ty;transform.tx = tx;var a = transform.a * view._inverseBoundsTransform.a + transform.b * view._inverseBoundsTransform.c, b = transform.a * view._inverseBoundsTransform.b + transform.b * view._inverseBoundsTransform.d, c = transform.c * view._inverseBoundsTransform.a + transform.d * view._inverseBoundsTransform.c;transform.d = transform.c * view._inverseBoundsTransform.b + transform.d * view._inverseBoundsTransform.d;transform.a = a;transform.b = b;transform.c = c;;
        }
        view = view._superview;
    }
    if (!sameWindow)
    {
        var frame = objj_msgSend(toWindow, "frame");
        transform.tx -= (frame.origin.x);
        transform.ty -= (frame.origin.y);
    }
    return transform;
}

