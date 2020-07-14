*begin "version 2017.2.0.16  6-23-2020  22:33:31"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*loaddefaultattributevaluesfromxml 
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementchecksettings 1 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
*entitybundleregister "__AUTOCONTACT_PREVIEW_BUNDLE_ABAQUS" "groups groups groups groups" 0
*setmacrofile "/opt/soft/hyperworks/2017/altair/hm/scripts/UserProfiles/../abaqus/abaqus.mac"
*enablemacromenu 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*loaddefaultattributevaluesfromxml 
*feinputpreserveincludefiles 
*createstringarray 15 "Abaqus " "Standard3D " "EXTRANODES_DISPLAY_SKIP " "ACCELEROMETERS_DISPLAY_SKIP " \
  "LOADCOLS_DISPLAY_SKIP " "RETRACTORS_DISPLAY_SKIP " "VECTORCOLS_DISPLAY_SKIP " \
  "SYSTCOLS_DISPLAY_SKIP " "PRIMITIVES_DISPLAY_SKIP " "BLOCKS_DISPLAY_SKIP " \
  "CROSSSECTION_DISPLAY_SKIP " "CONSTRAINEDRIGIDBODY_DISPLAY_SKIP " "RIGIDWALLS_DISPLAY_SKIP " \
  "SLIPRINGS_DISPLAY_SKIP " "CONTACTSURF_DISPLAY_SKIP "
*feinputwithdata2 "\#abaqus\\abaqus" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff2.inp" 0 0 0 0 0 1 15 1 0
*createmark sets 1 "_Surf-1_S1"
*clearmark sets 1
*setdisplayattributes 2 0
*drawlistresetstyle 
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 -33 -33 33 33
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 -33 -33 33 33
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 -33 -33 33 33
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 -33 -33 33 33
*viewset 1 0 0 0 0 1 0 0 0 0 1 0 -24.6594482 5.28773514 0 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*createmark elements 1 69-164 233-328 397-492 561-656 725-820 889-984 1053-1148 \
 
*findfaces elements 1
*startnotehistorystate {Modified color of Components "^faces"}
*createmark components 1 "^faces"
*setvalue comps mark=1 color=53
*createmark components 1 "^faces"
*clearmark components 1
*endnotehistorystate {Modified color of Components "^faces"}
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*rotateabout 0 0 0 0
*viewset 0.36598134 -0.0909427751 0.92616795 0 -0.112354381 0.983616164 0.140981331 0 -0.923814999 -0.155655563 0.349767342 0 -1.56407324 9.17912421 16.2558164 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*viewset 0.36598134 -0.0909427751 0.92616795 0 -0.112354381 0.983616164 0.140981331 0 -0.923814999 -0.155655563 0.349767342 0 -1.56407324 9.17912421 16.2558164 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*rotateabout 0 0 0 0
*viewset 0.176830113 -0.228784194 0.95728204 0 -0.373576053 0.884225734 0.28033156 0 -0.910588844 -0.407188708 0.0708894405 0 -1.8947271 15.4674528 23.227764 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*rotateabout 0 0 0 0
*viewset 0.168714229 -0.0801078073 0.98240432 0 -0.125008479 0.986904483 0.101943224 0 -0.977705676 -0.140008142 0.156490674 0 -0.216806309 8.78793869 21.0877332 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*rotateabout 0 0 0 0
*viewset 0.067310248 -0.119453576 0.990555487 0 -0.157959265 0.979010079 0.128794938 0 -0.985148822 -0.165136636 0.0470286122 0 -0.0307276671 9.41615103 23.8242847 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*viewset 0.067310248 -0.119453576 0.990555487 0 -0.157959265 0.979010079 0.128794938 0 -0.985148822 -0.165136636 0.0470286122 0 -0.0307276671 9.41615103 23.8242847 1 -55.4991634 -55.4991634 55.4991634 55.4991634
*view "rear"
*viewset -3.49148134e-15 0 1 0 1 -3.49148134e-15 3.49148134e-15 0 3.49148134e-15 1 1.21904419e-29 0 -11.5167984 6.85134207 0 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*createmark elements 1 1160 1166 1175-1177 1179 1180 1182-1186 1188 1191 1193 \
  1194 1196 1204 1208 1217 1218 1220-1222 1224 1227 1229 1230 1235 1241 1245 \
  1246 1254 1256-1260 1263 1270 1276 1277 1285 1287-1289 1291-1564
*deletemark elements 1
*rotateabout 0 0 0 0
*viewset -0.550492811 0.397692845 0.734028655 0 0.707013095 0.689647502 0.156584825 0 -0.443948364 0.605166691 -0.660820041 0 10.6806198 26.5930075 33.041002 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*rotateabout 0 0 0 0
*viewset -0.571557295 -0.0551946848 0.818703735 0 0.285556199 0.92199196 0.261511919 0 -0.769272329 0.383254971 -0.511210046 0 26.9468181 37.6885935 25.5605023 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*rotateabout 0 0 0 0
*viewset -0.693123921 0.217083201 0.687352976 0 0.331031997 0.942932187 0.0360098228 0 -0.640310118 0.252495098 -0.72543034 0 20.4987075 44.2265872 36.271517 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*viewset -0.693123921 0.217083201 0.687352976 0 0.331031997 0.942932187 0.0360098228 0 -0.640310118 0.252495098 -0.72543034 0 20.4987075 44.2265872 36.271517 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*startnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
*setvalue comps id=2 name=bc_faces
*endnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm2_0000.rad" 0 0 1 1 2
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*rotateabout 0 0 0 0
*viewset 0.365105182 -0.284522199 0.886422769 0 0.522402608 0.85073122 0.0578956456 0 -0.77058012 0.441931566 0.459241516 0 23.7554576 39.4906755 6.65472062 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*viewset 0.365105182 -0.284522199 0.886422769 0 0.522402608 0.85073122 0.0578956456 0 -0.77058012 0.441931566 0.459241516 0 23.7554576 39.4906755 6.65472062 1 -31.4495259 -21.2493028 31.4495259 71.2493028
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC2.hm" 1
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*viewset 0.365105182 -0.284522199 0.886422769 0 0.522402608 0.85073122 0.0578956456 0 -0.77058012 0.441931566 0.459241516 0 22.1476249 21.8303466 6.65472062 1 -52.8915872 -52.7817459 52.8915872 102.781746
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC2.hm" 1
# Session ended at "6-23-2020  22:47:01"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.2.0.16  6-24-2020  0:22:57"
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*feinputpreserveincludefiles 
*createstringarray 15 "Abaqus " "Standard3D " "EXTRANODES_DISPLAY_SKIP " "ACCELEROMETERS_DISPLAY_SKIP " \
  "LOADCOLS_DISPLAY_SKIP " "RETRACTORS_DISPLAY_SKIP " "VECTORCOLS_DISPLAY_SKIP " \
  "SYSTCOLS_DISPLAY_SKIP " "PRIMITIVES_DISPLAY_SKIP " "BLOCKS_DISPLAY_SKIP " \
  "CROSSSECTION_DISPLAY_SKIP " "CONSTRAINEDRIGIDBODY_DISPLAY_SKIP " "RIGIDWALLS_DISPLAY_SKIP " \
  "SLIPRINGS_DISPLAY_SKIP " "CONTACTSURF_DISPLAY_SKIP "
*feinputwithdata2 "\#abaqus\\abaqus" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff3.inp" 0 0 0 0 0 1 15 1 0
*createmark sets 1 "_Surf-1_S1"
*clearmark sets 1
*setdisplayattributes 2 0
*drawlistresetstyle 
*createmark elements 1 325-708 1033-1416 1741-2124 2449-2832 3157-3540 3865-4248 \
  4573-4956 5281-5664 5989-6372 6697-7080 7405-7788 8113-8496 8821-9204
*findfaces elements 1
*startnotehistorystate {Modified color of Components "^faces"}
*createmark components 1 "^faces"
*setvalue comps mark=1 color=53
*createmark components 1 "^faces"
*clearmark components 1
*endnotehistorystate {Modified color of Components "^faces"}
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*view "top"
*view "rightside"
*startnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
*setvalue comps id=2 name=bc_faces
*endnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
*createmark elements 1 9206 9208 9210 9212 9214 9216 9218 9220 9232 9242 9252 \
  9262 9272 9282 9299 9301 9302 9304 9306 9308 9310 9311 9313 9314 9316 9317 \
  9319 9320 9322 9323 9326 9327 9329 9331 9333 9335 9337 9339 9341-9349 9351 \
  9354 9356 9358 9360 9362 9364-9366 9383 9398 9400 9407 9409 9416 9418 9425 \
  9427 9434 9436 9443 9445 9460 9462 9463 9465 9467 9469 9471 9472 9474 9475 \
  9477 9478 9480-9484 9486 9489 9491 9493 9495 9497 9499-9501 9518 9526 9529 \
  9536 9544 9552 9560 9568 9576 9577 9592 9595 9597 9599 9601 9602 9604 9605 \
  9607 9608 9610-9615 9618 9633 9643 9653 9663 9673 9683 9684 9700 9703 9705 \
  9707 9709 9710 9712 9713 9715 9716 9718 9719 9721 9722 9725 9726 9728 9730 \
  9732 9734 9736 9738 9740-10804
*deletemark elements 1
*rotateabout 0 0 0 0
*viewset -0.823738453 0.0623448026 -0.563531797 0 -0.49145111 0.41711289 0.764521186 0 0.282720299 0.906713826 -0.312952504 0 -14.1360149 4.66430869 15.6476252 1 -18.7 -2.5 18.7 52.5
*viewset -0.823738453 0.0623448026 -0.563531797 0 -0.49145111 0.41711289 0.764521186 0 0.282720299 0.906713826 -0.312952504 0 -14.1360149 4.66430869 15.6476252 1 -18.7 -2.5 18.7 52.5
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*rotateabout 0 0 0 0
*viewset -0.035170709 0.818148614 -0.573930192 0 -0.998932146 -0.0459958548 -0.0043529564 0 -0.0299597751 0.573164222 0.818892658 0 -6.3190131 13.0030488 -12.6485038 1 -18.7 -2.5 18.7 52.5
*viewset -0.035170709 0.818148614 -0.573930192 0 -0.998932146 -0.0459958548 -0.0043529564 0 -0.0299597751 0.573164222 0.818892658 0 -6.3190131 13.0030488 -12.6485038 1 -18.7 -2.5 18.7 52.5
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm" 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm3_0000.rad" 0 0 1 1 2
*startnotehistorystate {Deleted Components}
*createmark components 1
*clearmark components 1
*createmark components 1 "Auto1" "bc_faces"
*deletemark components 1
*endnotehistorystate {Deleted Components}
*feinputpreserveincludefiles 
*createstringarray 15 "Abaqus " "Standard3D " "EXTRANODES_DISPLAY_SKIP " "ACCELEROMETERS_DISPLAY_SKIP " \
  "LOADCOLS_DISPLAY_SKIP " "RETRACTORS_DISPLAY_SKIP " "VECTORCOLS_DISPLAY_SKIP " \
  "SYSTCOLS_DISPLAY_SKIP " "PRIMITIVES_DISPLAY_SKIP " "BLOCKS_DISPLAY_SKIP " \
  "CROSSSECTION_DISPLAY_SKIP " "CONSTRAINEDRIGIDBODY_DISPLAY_SKIP " "RIGIDWALLS_DISPLAY_SKIP " \
  "SLIPRINGS_DISPLAY_SKIP " "CONTACTSURF_DISPLAY_SKIP "
*feinputwithdata2 "\#abaqus\\abaqus" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff3.inp" 0 0 0 0 0 1 15 1 0
*createmark sets 1 "_Surf-1_S1" "_Surf-1_S1:1"
*clearmark sets 1
*view "top"
*createmark elements 1 125-264 389-528 653-792 917-1056 1181-1320 1445-1584 \
  1709-1848 1973-2112
*findfaces elements 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*startnotehistorystate {Modified color of Components "^faces"}
*createmark components 1 "^faces"
*setvalue comps mark=1 color=53
*createmark components 1 "^faces"
*clearmark components 1
*endnotehistorystate {Modified color of Components "^faces"}
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*view "rear"
*createmark elements 1 2126 2133 2140 2151 2174 2176 2186 2192 2197 2230 2237 \
  2243 2248 2249 2259 2264 2269 2278 2285 2292 2293 2303 2315-2712
*deletemark elements 1
*createmark elements 1 2152 2153 2155-2157 2159-2164 2166 2169 2171 2173 2208 \
  2209 2211-2214 2216 2219 2221 2223 2224 2261-2263 2265 2266 2305-2308 2310-2314 \
 
*deletemark elements 1
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*rotateabout 0 0 0 0
*viewset 0.267752699 0.256731314 0.928653608 0 0.929147964 -0.323833814 -0.178369624 0 0.254936371 0.910615557 -0.325248756 0 -6.37340929 2.23461106 8.13121889 1 -18.7 -2.5 18.7 52.5
*rotateabout 0 0 0 0
*viewset 0.555059259 0.831032742 0.0359694441 0 0.63180303 -0.449328523 0.631608115 0 0.541049121 -0.327854328 -0.774452961 0 -13.526228 33.1963582 19.361324 1 -18.7 -2.5 18.7 52.5
*rotateabout 0 0 0 0
*viewset 0.0343826687 0.999394951 0.00525013501 0 -0.08355833 -0.0023602297 0.996500093 0 0.995909553 -0.0347010251 0.0834266221 0 -24.8977388 25.8675256 -2.08566555 1 -18.7 -2.5 18.7 52.5
*rotateabout 0 0 0 0
*viewset -0.0655205962 0.997843703 -0.00387236519 0 -0.996039474 -0.0656348873 -0.0599785581 0 -0.0601033888 -7.28022979e-05 0.998192155 0 1.50258472 25.0018201 -24.9548039 1 -18.7 -2.5 18.7 52.5
*rotateabout 0 0 0 0
*viewset -0.0489449563 0.996658412 -0.0653941933 0 -0.951873694 -0.0663782344 -0.299216312 0 -0.302557206 0.047601883 0.951941804 0 7.56393014 23.8099529 -23.7985451 1 -18.7 -2.5 18.7 52.5
*viewset -0.0453149806 0.996608899 -0.0686822789 0 -0.949698415 -0.0643042567 -0.306492876 0 -0.309870091 0.0513387327 0.949391838 0 7.74675227 23.7165317 -23.7347959 1 -18.7 -2.5 18.7 52.5
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm" 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm3_0000.rad" 0 0 1 1 2
*rotateabout 0 0 0 0
*viewset -0.0229941388 0.976035793 0.216391773 0 -0.947341086 -0.0904245399 0.307194189 0 0.31939965 -0.197933151 0.926718043 0 -7.98499125 29.9483288 -23.1679511 1 -18.7 -2.5 18.7 52.5
*viewset -0.0229941388 0.976035793 0.216391773 0 -0.947341086 -0.0904245399 0.307194189 0 0.31939965 -0.197933151 0.926718043 0 -7.98499125 29.9483288 -23.1679511 1 -18.7 -2.5 18.7 52.5
*rotateabout 0 0 0 0
*viewset -0.268927072 0.962752638 0.0280283467 0 -0.940102578 -0.256048456 -0.225047399 0 -0.209488362 -0.0868708589 0.973944598 0 5.23720905 27.1717715 -24.348615 1 -18.7 -2.5 18.7 52.5
*viewset -0.267878708 0.963425026 0.00729498683 0 -0.939345041 -0.25948513 -0.224272961 0 -0.214177242 -0.0669304606 0.974499062 0 5.35443106 26.6732615 -24.3624766 1 -18.7 -2.5 18.7 52.5
*settopologydisplaymode 0
*startnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
*setvalue comps id=2 name=bc_faces
*endnotehistorystate {Renamed Components from "^faces" to "bc_faces"}
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm" 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm3_0000.rad" 0 0 1 1 2
# Session ended at "6-24-2020  1:09:00"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.2.0.16  7-2-2020  10:23:35"
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm"
*setgeomrefinelevel 1
*viewset -0.267878708 0.963425026 0.00729498683 0 -0.939345041 -0.25948513 -0.224272961 0 -0.214177242 -0.0669304606 0.974499062 0 -1.73409036 27.0276876 -24.3624766 1 -68.8772763 -13.890873 68.8772763 63.890873
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC2.hm"
*setgeomrefinelevel 1
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*rotateabout 0 0 0 0
*viewset 0.642660048 -0.673977949 0.364337463 0 0.643501563 0.732925929 0.220738127 0 -0.415805004 0.0925921517 0.904728076 0 13.278247 30.563832 -4.48244341 1 -137.754553 -52.7817459 137.754553 102.781746
*viewset 0.642660048 -0.673977949 0.364337463 0 0.643501563 0.732925929 0.220738127 0 -0.415805004 0.0925921517 0.904728076 0 13.278247 30.563832 -4.48244341 1 -137.754553 -52.7817459 137.754553 102.781746
hm_answernext yes
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm"
*setgeomrefinelevel 1
*rotateabout 0 0 0 0
*viewset -0.101633082 0.593873853 0.798113127 0 -0.919757341 0.249629533 -0.302872134 0 -0.379100449 -0.764852236 0.520849217 0 -1.31507444 40.6210078 -13.0212304 1 -81.909347 -21.2493028 81.909347 71.2493028
*rotateabout 0 0 0 0
*viewset 0.139031723 0.766279405 0.627284667 0 -0.785721847 0.470908957 -0.401105888 0 -0.602753149 -0.437104824 0.667553754 0 4.27624306 32.4273225 -16.6888438 1 -81.909347 -21.2493028 81.909347 71.2493028
*rotateabout 0 0 0 0
*viewset 0.192191662 0.921345881 -0.337911427 0 -0.88685629 0.0156351614 -0.461780751 0 -0.420176493 0.388429284 0.820106338 0 -0.288173329 11.7889698 -20.5026584 1 -81.909347 -21.2493028 81.909347 71.2493028
*rotateabout 0 0 0 0
*viewset 0.253952626 0.9615352 0.104681056 0 -0.850777108 0.273551465 -0.448718072 0 -0.460093877 0.0248928864 0.88752125 0 0.709761262 20.8773798 -22.1880312 1 -81.909347 -21.2493028 81.909347 71.2493028
*viewset 0.253952626 0.9615352 0.104681056 0 -0.850777108 0.273551465 -0.448718072 0 -0.460093877 0.0248928864 0.88752125 0 0.709761262 20.8773798 -22.1880312 1 -81.909347 -21.2493028 81.909347 71.2493028
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC2.hm"
*setgeomrefinelevel 1
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*rotateabout 0 0 0 0
*viewset 0.636297154 -0.60417101 0.479690861 0 0.573222654 0.786419363 0.230131209 0 -0.516276786 0.128537835 0.846720913 0 15.7900416 29.6651899 -3.03226432 1 -137.754553 -52.7817459 137.754553 102.781746
*viewset 0.636297154 -0.60417101 0.479690861 0 0.573222654 0.786419363 0.230131209 0 -0.516276786 0.128537835 0.846720913 0 19.3514919 18.4720602 -3.03226432 1 -68.8772763 -13.890873 68.8772763 63.890873
*rotateabout 0 0 0 0
*viewset 0.607663646 -0.485581478 0.628454868 0 0.3235004 0.874026321 0.362526527 0 -0.725322262 -0.0169887902 0.688199823 0 12.2022061 22.935254 0.930762926 1 -115.837309 -40.4063913 115.837309 90.4063913
*viewset 0.607663646 -0.485581478 0.628454868 0 0.3235004 0.874026321 0.362526527 0 -0.725322262 -0.0169887902 0.688199823 0 12.2022061 22.935254 0.930762926 1 -115.837309 -40.4063913 115.837309 90.4063913
# Session ended at "7-2-2020  10:24:37"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.2.0.16  7-2-2020  10:24:44"
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm"
*setgeomrefinelevel 1
*rotateabout 0 0 0 0
*viewset -0.375838227 0.669780664 0.640421337 0 -0.747402182 0.189473507 -0.636780786 0 -0.547846334 -0.717978866 0.429384143 0 13.6961584 42.9494717 -10.7346036 1 -48.7035891 -2.5 48.7035891 52.5
*viewset -0.375838227 0.669780664 0.640421337 0 -0.747402182 0.189473507 -0.636780786 0 -0.547846334 -0.717978866 0.429384143 0 13.6961584 42.9494717 -10.7346036 1 -48.7035891 -2.5 48.7035891 52.5
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*startnotehistorystate {Hide Components "bc_faces"}
*createmark components 3 "bc_faces"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "bc_faces"}
*startnotehistorystate {Show Components "bc_faces"}
*createmark components 3 "bc_faces"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "bc_faces"}
# Session ended at "7-2-2020  10:25:01"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.2.0.16  7-2-2020  10:38:38"
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC3.hm"
*setgeomrefinelevel 1
*drawlistresetstyle 
*createmark elements 1 "displayed"
*splitsolidelements 1 1
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*viewset -0.267878708 0.963425026 0.00729498683 0 -0.939345041 -0.25948513 -0.224272961 0 -0.214177242 -0.0669304606 0.974499062 0 5.35443106 26.6732615 -24.3624766 1 -48.7035891 -2.5 48.7035891 52.5
*rotateabout 0 0 0 0
*viewset -0.558099079 0.621222125 0.550098618 0 -0.705035418 -0.00543523104 -0.709151266 0 -0.437550543 -0.783615677 0.441016998 0 10.9387636 44.5903919 -11.0254249 1 -48.7035891 -2.5 48.7035891 52.5
*rotateabout 0 0 0 0
*viewset -0.325482188 0.832577989 -0.448191073 0 -0.650110515 -0.541238441 -0.533307855 0 -0.686598619 0.117791521 0.717431177 0 -0.973735067 31.0144562 -17.9357794 1 -137.754553 -52.7817459 137.754553 102.781746
*rotateabout 0 0 0 0
*viewset -0.44618762 0.891836582 -0.0744588435 0 -0.422769757 -0.283379453 -0.86079139 0 -0.788785358 -0.352595514 0.503481939 0 1.58093339 42.7741321 -12.5870485 1 -137.754553 -52.7817459 137.754553 102.781746
*viewset -0.44618762 0.891836582 -0.0744588435 0 -0.422769757 -0.283379453 -0.86079139 0 -0.788785358 -0.352595514 0.503481939 0 1.58093339 42.7741321 -12.5870485 1 -137.754553 -52.7817459 137.754553 102.781746
*startnotehistorystate {Hide Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "Auto1"}
*startnotehistorystate {Show Components "Auto1"}
*createmark components 3 "Auto1"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "Auto1"}
*startnotehistorystate {Hide Components "bc_faces"}
*createmark components 3 "bc_faces"
*createstringarray 2 "elements_on" "geometry_off"
*hideentitybymark 3 1 2
*endnotehistorystate {Hide Components "bc_faces"}
*startnotehistorystate {Show Components "bc_faces"}
*createmark components 3 "bc_faces"
*createstringarray 2 "elements_on" "geometry_off"
*showentitybymark 3 1 2
*endnotehistorystate {Show Components "bc_faces"}
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
# Session ended at "7-2-2020  10:40:11"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.2.0.16  7-2-2020  10:41:17"
*templatefileset "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0000.rad" 0 0 1 1 2
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 2 "HMBOMCOMMENTS_XML" "EXPORTIDS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0000.inp" 0 0 1 1 2
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*reviewclearall 
*retainmarkselections 0
*createstringarray 0
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/ls-dyna971/dyna.key" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.dat" 0 0 1 1 0
*viewset -0.44618762 0.891836582 -0.0744588435 0 -0.422769757 -0.283379453 -0.86079139 0 -0.788785358 -0.352595514 0.503481939 0 1.58093339 42.7741321 -12.5870485 1 -137.754553 -52.7817459 137.754553 102.781746
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
*retainmarkselections 0
*createstringarray 1 "CONNECTORS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2017/altair/templates/feoutput/misc/triasto.stl" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.dat" 0 0 1 1 1
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
# Session ended at "7-2-2020  11:01:23"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  11:01:34"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*loaddefaultattributevaluesfromxml 
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementchecksettings 1 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
*entitybundleregister "__AUTOCONTACT_PREVIEW_BUNDLE_ABAQUS" "groups groups groups groups" 0
*setmacrofile "/opt/soft/hyperworks/2018/altair/hm/scripts/UserProfiles/../abaqus/abaqus.mac"
*enablemacromenu 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d"
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
# Session ended at "7-2-2020  11:06:38"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  11:06:42"
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*elementchecksettings 0 0 0 1 1 0 0 0 0 0 0 0 1 1 1 1 0 0 1 0 0 0 0
*setmacrofile "/opt/soft/hyperworks/2018/altair/hm/scripts/UserProfiles/../radioss/radioss.mac"
*enablemacromenu 1
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss2018.blk"
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*createmark nodes 1
*clearmark nodes 1
*setgeomrefinelevel 1
*reviewclearall 
*setcurrentinclude 0 ""
*cardcreate "HEADER_CARD"
*attributeupdateint cards 5 233 20 1 1 1
*setcurrentinclude 0 ""
*retainmarkselections 0
*createstringarray 1 "HMBOMCOMMENTS_XML"
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss2018.blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0000.rad" 0 0 0 1 1
*cardcreate "ENG_RUN"
*attributeupdatestring cards 6 6161 20 1 0 "nonlinear_reac_diff_cube_hm4"
*setcurrentinclude 0 ""
*cardcreate "ENG_VERS"
*setcurrentinclude 0 ""
*attributeupdatestring cards 6 6161 20 1 0 "nonlinear_reac_diff_cube_hm4"
*setcurrentinclude 0 ""
*createstringarray 1 "CONNECTORS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/enginecard2018blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0001.rad" 0 0 2 1 1
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
# Session ended at "7-2-2020  14:16:56"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  14:17:59"
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss2018.blk"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*loaddefaultattributevaluesfromxml 
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*elementchecksettings 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
*setmacrofile "/opt/soft/hyperworks/2018/altair/hm/scripts/UserProfiles/../radioss/radioss.mac"
*enablemacromenu 1
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss140.blk"
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*createmark nodes 1
*clearmark nodes 1
*setgeomrefinelevel 1
*reviewclearall 
*setcurrentinclude 0 ""
*attributeupdateint cards 5 233 20 1 1 1
*setcurrentinclude 0 ""
*retainmarkselections 0
*createstringarray 1 "HMBOMCOMMENTS_XML"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss140.blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0000.rad" 0 0 0 1 1
*attributeupdatestring cards 6 6161 20 1 0 "nonlinear_reac_diff_cube_hm4"
*setcurrentinclude 0 ""
*attributeupdatestring cards 6 6161 20 1 0 "nonlinear_reac_diff_cube_hm4"
*setcurrentinclude 0 ""
*createstringarray 1 "CONNECTORS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/enginecard140blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0001.rad" 0 0 2 1 1
*reviewclearall 
*setcurrentinclude 0 ""
*attributeupdateint cards 5 233 20 1 1 1
*setcurrentinclude 0 ""
*retainmarkselections 0
*setcurrentinclude 0 ""
*cardcreate "ENG_RADIOSS_HEADER"
*setcurrentinclude 0 ""
*cardcreate "ENG_END_HEADER"
*attributeupdateint cards 8 4678 20 1 1 1
*attributeupdateint cards 9 4678 20 1 1 1
*attributeupdatestring cards 6 6161 20 1 0 "nonlinear_reac_diff_cube_hm4"
*setcurrentinclude 0 ""
*createstringarray 1 "HMBOMCOMMENTS_XML"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/merged_radioss2018.blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/nonlinear_reac_diff_cube_hm4_0000.rad" 0 0 1 1 1
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
*retainmarkselections 0
*createstringarray 2 "HM_NODEELEMS_SET_COMPRESS_SKIP " "EXPORT_SYSTEM_LONGFORMAT "
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/nastranNX/general" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.dat" 0 0 1 1 2
*retainmarkselections 0
*createstringarray 0
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/hm/general" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.hmascii" 0 0 1 1 0
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 1 "EXPORTIDS_SKIP"
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss140.blk" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.inp" 0 0 1 1 1
*rotateabout 0 0 0 0
*viewset -0.321995022 0.933204729 0.159524732 0 -0.763431296 -0.156286895 -0.62669535 0 -0.559903439 -0.323578956 0.762761298 0 -4.14111458 42.0487181 -19.0690325 1 -137.754553 -54.1085135 137.754553 104.108513
*viewset -0.321995022 0.933204729 0.159524732 0 -0.763431296 -0.156286895 -0.62669535 0 -0.559903439 -0.323578956 0.762761298 0 -4.14111458 42.0487181 -19.0690325 1 -137.754553 -54.1085135 137.754553 104.108513
*drawlistresetstyle 
*displaycollector plots "none" "" 1 0
*freesimulation 
*createmark elements 1 2310-19765
*maskentitymark elements 1 0
*maskreverse elements
*viewset -0.321995022 0.933204729 0.159524732 0 -0.763431296 -0.156286895 -0.62669535 0 -0.559903439 -0.323578956 0.762761298 0 18.424038 42.1566348 -19.0690325 1 -57.9186547 -8.26103269 57.9186547 58.2610327
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
# Session ended at "7-2-2020  14:24:23"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  14:24:34"
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/radioss/radioss140.blk"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*loaddefaultattributevaluesfromxml 
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementchecksettings 1 0 0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0
*entitybundleregister "__AUTOCONTACT_PREVIEW_BUNDLE_ABAQUS" "groups groups groups groups" 0
*setmacrofile "/opt/soft/hyperworks/2018/altair/hm/scripts/UserProfiles/../abaqus/abaqus.mac"
*enablemacromenu 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d"
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 1 "EXPORTIDS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.inp" 0 0 1 1 1
# Session ended at "7-2-2020  14:25:39"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  15:29:53"
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*drawlistresetstyle 
*createmark nodes 1 "displayed"
*renumbersolverid nodes 1 1 1 0 0 0 0 0
*createmark elements 1 "displayed"
*renumbersolverid elements 1 1 1 0 0 0 0 0
hm_answernext yes
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 1 "EXPORTIDS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.inp" 0 0 1 1 1
# Session ended at "7-2-2020  15:30:34"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
*begin "version 2017.3.0.17  7-2-2020  15:33:07"
*templatefileset "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d"
*menufilterset "*"
*menufilterdisable 
*createmark collections 1
*clearmark collections 1
*createmark collections 2
*clearmark collections 2
*createmark controllers 1
*clearmark controllers 1
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*settopologydisplaymode 0
*ME_CoreBehaviorAdjust "allowable_actions_policy=TC_lite"
*createmark sets 1
*clearmark sets 1
*createmark sets 1
*clearmark sets 1
*elementtype 104 7
*elementtype 210 3
*elementtype 213 3
*elementtype 220 3
*elementtype 5 1
*elementtype 55 1
*elementtype 206 1
*elementtype 205 7
*elementtype 208 7
*elementtype 56 2
*loaddefaultattributevaluesfromxml 
*readfile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm"
*setgeomrefinelevel 1
*drawlistresetstyle 
*createmark nodes 1 "displayed"
*renumbersolverid nodes 1 1 1 0 0 0 0 0
*viewset -0.321995022 0.933204729 0.159524732 0 -0.763431296 -0.156286895 -0.62669535 0 -0.559903439 -0.323578956 0.762761298 0 -74.887856 46.0446303 -19.0690325 1 -275.509105 -133.217027 275.509105 183.217027
*nodecleartempmark 
*nodecleartempmark 
*nodecleartempmark 
*nodecleartempmark 
*createmark nodes 1 "all"
*renumbersolverid nodes 1 1 1 0 0 0 0 0
*createmark elements 1
*clearmark elements 1
*createmark systems 1
*clearmark systems 1
*retainmarkselections 0
*createstringarray 1 "EXPORTIDS_SKIP"
hm_answernext yes
*feoutputwithdata "/opt/soft/hyperworks/2018/altair/templates/feoutput/abaqus/standard.3d" "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/BC4.inp" 0 0 0 1 1
hm_answernext yes
*writefile "/home/km262911/IFAM_local/01_Drug_Eluting_Heart_Stents/10_Soft_tissue_modeling/01_Codes/plaque_growth/plaque_growth/in/cube_circBC4.hm" 1
# Session ended at "7-2-2020  15:35:14"
return; # Stop script and return to application 
# *quit 1; # Uncomment to exit application
