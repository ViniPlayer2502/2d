#region Atalho de var

var rkey = keyboard_check(vk_right) or keyboard_check(ord("D"));
var lkey = keyboard_check(vk_left) or keyboard_check(ord("A"));
var jkey = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
var akey = mouse_check_button(mb_left)
var ckey = keyboard_check(vk_control)

var ground = place_meeting(x, y + 1, obj_solid)

image_xscale = dir;
#endregion

#region Movimentação

#region Interagir

if(keyboard_check(ord("E")))
{
	if(place_meeting(x,y,obj_chest))
	{
		global.chave++;
		show_message("+1 Chave")
	}
	instance_destroy(obj_chest)
}

if (keyboard_check_pressed(ord("E")))
{
    if (place_meeting(x, y, obj_porta) and obj_porta.estado == "fechada" and global.chave >= 0)
    {
        obj_porta.estado = "abrindo"; // inicia animação de abrir
		instance_destroy(inst_7A5C8B18)
    }
}

#endregion

#region Parado

// 1. Detecta se o jogador PAROU de apertar as teclas de movimento agora


// Se estiver usando o sprite de ataque
if (sprite_index == spr_player_attack)
{
	meio_do_ataque = true
    // Se chegou no último frame
    if (image_index >= image_number - 1)
    {
        // troca para o sprite parado
        sprite_index = spr_player;
        
		meio_do_ataque = false
		
        // reinicia a animação
        image_index = 0;
    }
}

if(!jkey and !rkey and !lkey and !akey and meio_do_ataque == false and meio_do_pulo == false )
{
	sprite_index = spr_player
	meio_do_ataque = false
	meio_do_pulo = false
}

if (sprite_index == spr_player_jump)
{
	meio_do_pulo = true
    // Se chegou no último frame
    if (image_index >= image_number - 1)
    {
        // troca para o sprite parado
        sprite_index = spr_player;
        
		meio_do_pulo = false
		
        // reinicia a animação
        image_index = 0;
    }
}



#endregion

#region Atacando
if (akey) {
    if (!global.ataque_criado) { // Verifica se já foi criado
        image_index = 0;
        sprite_index = spr_player_attack;
        global.ataque_dir = dir;
        var attack = instance_create_layer(x + (dir * 1), y, "Instances", obj_attack_box);
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

#region Andando e Correndo

if(keyboard_check(vk_control) and (keyboard_check(vk_right) or keyboard_check(ord("D"))) or keyboard_check(vk_control) and (keyboard_check(vk_left) or keyboard_check(ord("A"))))
{
	sprite_index = spr_player_run
}else if(keyboard_check(vk_right) or keyboard_check(ord("D")) or keyboard_check(vk_left) or keyboard_check(ord("A")))
{
	sprite_index = spr_player_walking
}

if (rkey and ckey){
    
    hspd = spd_r;
    dir = 1;

}else if (rkey){
    
    hspd = spd;
    dir = 1;

}


if (lkey and ckey){

    hspd = -3;
    dir =  -1;
    
}if (lkey){

    hspd = -spd;
    dir =  -1;
    
}


if ((!rkey and !lkey and ckey) or (rkey and lkey and ckey)){

    hspd = 0;

}else if ((!rkey && !lkey) or (rkey && lkey)){

    hspd = 0;

}

if (place_meeting(x+hspd, y, obj_solid)){
    while (!place_meeting(x+sign(hspd), y, obj_solid)){
        x += sign(hspd);
    }
    hspd = 0;
}

x += hspd;

if (place_meeting(x, y+vspd, obj_solid)){
    while (!place_meeting(x, y+sign(vspd), obj_solid)){
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

if keyboard_check(ord("Z"))
{
	show_debug_message(global.damage)
}


if(room == Room1_Child_1)
{
	show_message("Mundo Corrompido")show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
	show_message("Mundo Corrompido")
}