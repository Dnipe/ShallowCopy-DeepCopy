 begin -[ViewController viewWillAppear:], 66
 0x1002c4120, strongStr
 0x1002c4140, copysStr
 ===============
 0x280930750, strongMStr
 ===============
 0x28055ca00, (
    strongArray
)
 0x28055cc20, (
    copysArray
)
 ===============
 0x280930060, (
    strongMArray
)
 ===============
 0x280744320, {
    key = strongDic;
}
 0x280744380, {
    key = copysDic;
}
 ===============
 0x2807443c0, {
    key = strongMDic;
}
 end -[ViewController viewWillAppear:], 81



 begin -[OneViewController viewDidLoad], 22
 0x1002c4120, strongStr
 0x1002c4140, copysStr
 ++++++++++++++++++
 0x280930750, strongMStr
 ++++++++++++++++++
 0x28055ca00, (
    strongArray
)
 0x28055cc20, (
    copysArray
)
 ++++++++++++++++++
 0x280930060, (
    strongMArray
)
 ++++++++++++++++++
 0x280744320, {
    key = strongDic;
}
 0x280744380, {
    key = copysDic;
}
 ++++++++++++++++++
 0x2807443c0, {
    key = strongMDic;
}



 -[OneViewController viewDidLoad], 69
 0x280934120, strongStr-one
 0x280934750, copysStr-one
 ++++++++++++++++++
 0x280930750, strongMStr-one
 ++++++++++++++++++
 0x28055ca00, (
    strongArray
)
 0x28055cc20, (
    copysArray
)
 ++++++++++++++++++
 0x280930060, (
    strongMArray,
    one
)
 ++++++++++++++++++
 0x280744320, {
    key = strongDic;
}
 0x280744380, {
    key = copysDic;
}
 ++++++++++++++++++
 0x2807443c0, {
    key = strongMDic;
    one = one;
}
 end -[OneViewController viewDidLoad], 85
 begin -[ViewController viewWillAppear:], 66
 0x1002c4120, strongStr
 0x1002c4140, copysStr
 ===============
 0x280930750, strongMStr-one
 ===============
 0x28055ca00, (
    strongArray
)
 0x28055cc20, (
    copysArray
)
 ===============
 0x280930060, (
    strongMArray,
    one
)
 ===============
 0x280744320, {
    key = strongDic;
}
 0x280744380, {
    key = copysDic;
}
 ===============
 0x2807443c0, {
    key = strongMDic;
    one = one;
}
 end -[ViewController viewWillAppear:], 81
