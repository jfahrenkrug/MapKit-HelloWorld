I;21;Foundation/CPObject.jc;8086;
CPDeleteKeyCode = 8;
CPTabKeyCode = 9;
CPReturnKeyCode = 13;
CPEscapeKeyCode = 27;
CPLeftArrowKeyCode = 37;
CPUpArrowKeyCode = 38;
CPRightArrowKeyCode = 39;
CPDownArrowKeyCode = 40;
{var the_class = objj_allocateClassPair(CPObject, "CPResponder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_menu"), new objj_ivar("_nextResponder")]);
objj_registerClassPair(the_class);
objj_addClassForBundle(the_class, objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(the_class, [new objj_method(sel_getUid("acceptsFirstResponder"), function $CPResponder__acceptsFirstResponder(self, _cmd)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("becomeFirstResponder"), function $CPResponder__becomeFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("resignFirstResponder"), function $CPResponder__resignFirstResponder(self, _cmd)
{ with(self)
{
    return YES;
}
}), new objj_method(sel_getUid("setNextResponder:"), function $CPResponder__setNextResponder_(self, _cmd, aResponder)
{ with(self)
{
    _nextResponder = aResponder;
}
}), new objj_method(sel_getUid("nextResponder"), function $CPResponder__nextResponder(self, _cmd)
{ with(self)
{
    return _nextResponder;
}
}), new objj_method(sel_getUid("interpretKeyEvents:"), function $CPResponder__interpretKeyEvents_(self, _cmd, events)
{ with(self)
{
    var event,
        index = 0;
    while(event = events[index++])
    {
        switch(objj_msgSend(event, "keyCode"))
        {
            case CPLeftArrowKeyCode: objj_msgSend(self, "moveBackward:", self);
                                        break;
            case CPRightArrowKeyCode: objj_msgSend(self, "moveForward:", self);
                                        break;
            case CPUpArrowKeyCode: objj_msgSend(self, "moveUp:", self);
                                        break;
            case CPDownArrowKeyCode: objj_msgSend(self, "moveDown:", self);
                                        break;
            case CPDeleteKeyCode: objj_msgSend(self, "deleteBackward:", self);
                                        break;
            case CPReturnKeyCode:
            case 3: objj_msgSend(self, "insertLineBreak:", self);
                                        break;
            case CPEscapeKeyCode: objj_msgSend(self, "cancel:", self);
                                        break;
            case CPTabKeyCode: var shift = objj_msgSend(event, "modifierFlags") & CPShiftKeyMask;
                                        if (!shift)
                                            objj_msgSend(self, "insertTab:", self);
                                        else
                                            objj_msgSend(self, "insertBackTab:", self);
                                        break;
            default: objj_msgSend(self, "insertText:", objj_msgSend(event, "characters"));
        }
    }
}
}), new objj_method(sel_getUid("mouseDown:"), function $CPResponder__mouseDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseDragged:"), function $CPResponder__mouseDragged_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseUp:"), function $CPResponder__mouseUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseMoved:"), function $CPResponder__mouseMoved_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseEntered:"), function $CPResponder__mouseEntered_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("mouseExited:"), function $CPResponder__mouseExited_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("scrollWheel:"), function $CPResponder__scrollWheel_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyDown:"), function $CPResponder__keyDown_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("keyUp:"), function $CPResponder__keyUp_(self, _cmd, anEvent)
{ with(self)
{
    objj_msgSend(_nextResponder, "performSelector:withObject:", _cmd, anEvent);
}
}), new objj_method(sel_getUid("performKeyEquivalent:"), function $CPResponder__performKeyEquivalent_(self, _cmd, anEvent)
{ with(self)
{
    return NO;
}
}), new objj_method(sel_getUid("deleteBackward:"), function $CPResponder__deleteBackward_(self, _cmd, aSender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertLineBreak:"), function $CPResponder__insertLineBreak_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "insertNewline:", aSender);
}
}), new objj_method(sel_getUid("insertNewline:"), function $CPResponder__insertNewline_(self, _cmd, aSender)
{ with(self)
{
    objj_msgSend(self, "insertNewline:", aSender);
}
}), new objj_method(sel_getUid("cancel:"), function $CPResponder__cancel_(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertTab:"), function $CPResponder__insertTab_(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertBackTab:"), function $CPResponder__insertBackTab_(self, _cmd, sender)
{ with(self)
{
}
}), new objj_method(sel_getUid("insertText:"), function $CPResponder__insertText_(self, _cmd, aString)
{ with(self)
{
}
}), new objj_method(sel_getUid("doCommandBySelector:"), function $CPResponder__doCommandBySelector_(self, _cmd, aSelector)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
        objj_msgSend(self, "performSelector:", aSelector);
    else
        objj_msgSend(_nextResponder, "doCommandBySelector:", aSelector);
}
}), new objj_method(sel_getUid("tryToPerform:with:"), function $CPResponder__tryToPerform_with_(self, _cmd, aSelector, anObject)
{ with(self)
{
    if(objj_msgSend(self, "respondsToSelector:", aSelector))
    {
        objj_msgSend(self, "performSelector:withObject:", aSelector, anObject);
        return YES;
    }
    return objj_msgSend(_nextResponder, "tryToPerform:with:", aSelector, anObject);
}
}), new objj_method(sel_getUid("setMenu:"), function $CPResponder__setMenu_(self, _cmd, aMenu)
{ with(self)
{
    _menu = aMenu;
}
}), new objj_method(sel_getUid("menu"), function $CPResponder__menu(self, _cmd)
{ with(self)
{
    return _menu;
}
}), new objj_method(sel_getUid("undoManager"), function $CPResponder__undoManager(self, _cmd)
{ with(self)
{
    return objj_msgSend(_nextResponder, "performSelector:", _cmd);
}
}), new objj_method(sel_getUid("noResponderFor:"), function $CPResponder__noResponderFor_(self, _cmd, anEventSelector)
{ with(self)
{
}
})]);
}
var CPResponderNextResponderKey = "CPResponderNextResponderKey";
{
var the_class = objj_getClass("CPResponder")
if(!the_class) objj_exception_throw(new objj_exception(OBJJClassNotFoundException, "*** Could not find definition for class \"CPResponder\""));
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPResponder__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPObject") }, "init");
    if (self)
        _nextResponder = objj_msgSend(aCoder, "decodeObjectForKey:", CPResponderNextResponderKey);
    return self;
}
}), new objj_method(sel_getUid("encodeWithCoder:"), function $CPResponder__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
    if (_nextResponder !== nil)
        objj_msgSend(aCoder, "encodeConditionalObject:forKey:", _nextResponder, CPResponderNextResponderKey);
}
})]);
}

