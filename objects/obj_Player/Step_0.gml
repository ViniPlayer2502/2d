/// @description Movement
var rkey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var lkey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jkey = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
image_xscale = dir;

if (place_meeting(x, y+1, obj_Solid)) {
    airjump = 1
    vspd = 0;
    
    if (jkey) {
        vspd = -jspd;
        }

} else {

    if (vspd < 10){
        vspd += 0.5;
        }
        

        if (airjump > 0){
            if (jkey){
                vspd = -jspd;
                airjump -= 1
            }
        }
}

if (rkey){
    
    hspd = spd;
    dir = 1;

}


if (lkey){

    hspd = -spd;
    dir =  -1;
    
}


if ((!rkey && !lkey) || (rkey && lkey)){

    hspd = 0;

}

if (place_meeting(x+hspd, y, obj_Solid)){
    while (!place_meeting(x+sign(hspd), y, obj_Solid)){
        x += sign(hspd);
    }
    hspd = 0;
}

x += hspd;

if (place_meeting(x, y+vspd, obj_Solid)){
    while (!place_meeting(x, y+sign(vspd), obj_Solid)){
        y += sign(vspd)
    }
    vspd = 0;
}

y += vspd;

///Smooth Camera
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (((x-(__view_get( e__VW.WView, 0 )/2)) - __view_get( e__VW.XView, 0 )) * 0.1) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (((y-(__view_get( e__VW.HView, 0 )/2)) - __view_get( e__VW.YView, 0 )) * 0.1) );
__view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width-__view_get( e__VW.WView, 0 )) )
__view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height-__view_get( e__VW.HView, 0 )) )
__background_set( e__BG.X, 0, __view_get( e__VW.XView, 0 ) );
__background_set( e__BG.Y, 0, __view_get( e__VW.YView, 0 ) );

