i;8;CPView.jc;2703;
var _1=objj_allocateClassPair(CPView,"_CPCibCustomView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_className")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("customClassName"),function(_3,_4){
with(_3){
return _className;
}
})]);
var _5="_CPCibCustomViewClassNameKey";
var _1=objj_getClass("_CPCibCustomView");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"_CPCibCustomView\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CPView")},"initWithCoder:",_8);
if(_6){
_className=objj_msgSend(_8,"decodeObjectForKey:",_5);
}
return _6;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_9,_a,_b){
with(_9){
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPView")},"encodeWithCoder:",_b);
objj_msgSend(_b,"encodeObject:forKey:",_className,_5);
}
}),new objj_method(sel_getUid("drawRect:"),function(_c,_d,_e){
with(_c){
var _f=objj_msgSend(_c,"bounds"),_10=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
CGContextSetLineWidth(_10,1);
CGContextSetStrokeColor(_10,objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",169/255,173/255,178/255,1));
CGContextStrokeRect(_10,CGRectInset(CGRectIntegral(_f),0.5,0.5));
CGContextSetFillColor(_10,objj_msgSend(CPColor,"colorWithCalibratedRed:green:blue:alpha:",224/255,236/255,250/255,1));
CGContextFillRect(_10,CGRectInset(_f,2,2));
}
}),new objj_method(sel_getUid("_cibInstantiate"),function(_11,_12){
with(_11){
var _13=CPClassFromString(_className);
if(!_13){
_13=objj_msgSend(CPView,"class");
}
if(_13===objj_msgSend(_11,"class")){
_className="CPView";
return _11;
}
var _14=objj_msgSend(objj_msgSend(_13,"alloc"),"initWithFrame:",objj_msgSend(_11,"frame"));
if(_14){
objj_msgSend(_14,"setBounds:",objj_msgSend(_11,"bounds"));
var _15=objj_msgSend(objj_msgSend(_11,"subviews"),"copy"),_16=0,_17=_15.length;
for(;_16<_17;++_16){
objj_msgSend(_14,"addSubview:",_15[_16]);
}
objj_msgSend(_14,"setAutoresizingMask:",objj_msgSend(_11,"autoresizingMask"));
objj_msgSend(_14,"setAutoresizesSubviews:",objj_msgSend(_11,"autoresizesSubviews"));
objj_msgSend(_14,"setHitTests:",objj_msgSend(_11,"hitTests"));
objj_msgSend(_14,"setHidden:",objj_msgSend(_11,"isHidden"));
objj_msgSend(_14,"setAlphaValue:",objj_msgSend(_11,"alphaValue"));
objj_msgSend(_superview,"replaceSubview:with:",_11,_14);
objj_msgSend(_14,"setBackgroundColor:",objj_msgSend(_11,"backgroundColor"));
}
return _14;
}
})]);
