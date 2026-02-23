/*

switch(state){
	
	#region case "idle"
	
	case "idle":
		vspd = 0;
		hspd = 0;
		sprite_index = spr_player
		
		if(keyboard_check(vk_right) || keyboard_check(ord("D")) or keyboard_check(vk_left) || keyboard_check(ord("A")))
	{  
		state = "free"
	}
	
		if(keyboard_check(vk_space) or keyboard_check(ord("W")))
	{
		state = "jump"
		image_index = 0;
	}
	
	if(mouse_check_button(mb_left)){
		state = "atk"
			image_index = 0;
	}
	
	break;
	
	#endregion
	
	#region case "free"

	case "free":
	
	
	image_xscale = dir;
	spd = 2

	if (rkey){
    
    hspd = spd;
    dir = 1;
	sprite_index = spr_player_walking
}


	if (lkey){

    hspd = -spd;
    dir =  -1;
    sprite_index = spr_player_walking
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

	

	if(keyboard_check(vk_control))
	{
		spd = 3
		sprite_index = spr_player_run
	}else{
		spd = 2
	}


	if(mouse_check_button(mb_left)){
		state = "atk"
			image_index = 0;
	}
	
	if(keyboard_check(vk_space))
	{
		state = "jump"
		image_index = 0;
	}
	
break;

#endregion

	#region case "atk"
		case "atk":
			sprite_index = spr_player_attack
			if(image_index >= image_number - 1)
			{
				state = "free"
				image_index = spr_player
			}
			if(keyboard_check(vk_space))
			{
				state = "jump"
				image_index = spr_player_jump
			}
			
		break;
	
	#endregion
	
	#region case "jump"
	
		case "jump":
	
	if (ground) {
    
        airjump = 1
    
	    if (jkey) {
            vspd = -jspd;
		    sprite_index = spr_player_jump
			image_xscale = dir;
        }

	} else {

	    if (vspd < 10){
            vspd += 0.5;
        }
        
	    if (airjump > 0){
            if (jkey){
                vspd = -jspd;
                airjump -= 1
			    sprite_index = spr_player_jump
				image_xscale = dir;

				if(place_meeting(x,y,obj_Solid))
				{
				state = "free"
				sprite_index = spr_player_walking
				image_index = 0;
					}

				if(mouse_check_button(mb_left)){
			    state = "atk"
				sprite_index = spr_player_attack
				image_index = 0;
			}
            }
        }
	}
	
	#region colisão
	if (place_meeting(x, y + vspd, obj_Solid))
{
    while (!place_meeting(x, y + sign(vspd), obj_Solid))
    {
        y += sign(vspd);
    }
    vspd = 0;
}
	
	y += vspd;
	#endregion
	
	#region //pa mover no ar
	if (rkey)
	{
	    hspd = spd;
	    dir = 1;
	}
	else if (lkey)
	{
	    hspd = -spd;
	    dir = -1;
	}
	else
	{
	    hspd = 0;
	}

	if (place_meeting(x + hspd, y, obj_Solid))
	{
	    while (!place_meeting(x + sign(hspd), y, obj_Solid))
	    {
	        x += sign(hspd);
	    }
	    hspd = 0;
	}

	x += hspd;
	#endregion
	
	#region trocar de state
	
	if(place_meeting(x,y,obj_Solid))
		{
			state = "free"
			sprite_index = spr_player_walking
			image_index = 0;
		}

		if(mouse_check_button(mb_left)){
		    state = "atk"
			sprite_index = spr_player_attack
			image_index = 0;
		}
		
		#endregion
		
	
break;

	#endregion
	
}

*/