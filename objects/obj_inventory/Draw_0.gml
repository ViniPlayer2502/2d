var player = instance_find(obj_player, 0);

if (player != noone)
{
    if (variable_instance_exists(player, "inventory"))
    {
        draw_text(20, 20, "INVENTÁRIO:");

        var inv = player.inventory;

        for (var i = 0; i < ds_list_size(inv); i++)
        {
            draw_text(20, 50 + (i * 20), inv[| i]);
        }
    }
}

