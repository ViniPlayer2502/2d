#region Atalho de var

var rkey = keyboard_check(vk_right) || keyboard_check(ord("D"));
var lkey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jkey = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
var akey = mouse_check_button(mb_left)

var movendo = jkey or akey or rkey or lkey;

var ground = place_meeting(x, y + 1, obj_Solid)

image_xscale = dir;
#endregion

#region Movimentação

#region Parado

// 1. Detecta se o jogador PAROU de apertar as teclas de movimento agora
var parou_de_andar = !movendo; 

if (parou_de_andar) {
    // Só ativa o alarme se ele já não estiver rodando (valor -1 significa parado)
    if (alarm[0] == -1) {
        alarm[0] = game_get_speed(gamespeed_fps) * 1; 
    }
}

// 2. Se ele voltar a andar cancelamos a contagem para ele não mudar de sprite do nada
if (movendo) {
    alarm[0] = -1; // Cancela o timer
    sprite_index = spr_player_walking; // Garante que volta pro sprite normal
}

#endregion

#region Atacando
if (akey) {
    if (!global.ataque_criado) { // Verifica se já foi criado
        image_index = 0;
        sprite_index = spr_player_attack;
        global.ataque_dir = dir;
        var attack = instance_create_layer(x + (dir * 40), y, "Instances", obj_attack_box);
        attack.offset = 40;
        attack.dir = dir;
        global.ataque_criado = true; // Marca que já criou
    }
} else {
    // Se não estiver atacando, reseta a flag para permitir novo ataque depois
    global.ataque_criado = false;
}



#endregion

#region Pulando

if(jkey)
{
	image_index = 0;
	sprite_index = spr_player_jump
}

if (ground) {
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

#endregion

#region Andando

if(rkey or lkey)
{
	sprite_index = spr_player_walking
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

#endregion

#endregion

#region///Smooth Camera
	__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (((x-(__view_get( e__VW.WView, 0 )/2)) - __view_get( e__VW.XView, 0 )) * 0.1) );
	__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (((y-(__view_get( e__VW.HView, 0 )/2)) - __view_get( e__VW.YView, 0 )) * 0.1) );
	__view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width-__view_get( e__VW.WView, 0 )) )
	__view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height-__view_get( e__VW.HView, 0 )) )
	__background_set( e__BG.X, 0, __view_get( e__VW.XView, 0 ) );
	__background_set( e__BG.Y, 0, __view_get( e__VW.YView, 0 ) );
	
#endregion

