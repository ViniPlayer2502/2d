 if (sprite_index == spr_player_attack)
 {
	if (image_index >= image_number - 1)
    {
        // troca para o sprite parado
        sprite_index = spr_player;
        
        // reinicia a animação
        image_index = 0;
    }
 }
 
 if (sprite_index == spr_player_run or spr_player_walking)
 {
	 sprite_index = spr_player
	 image_index = 0;
 }