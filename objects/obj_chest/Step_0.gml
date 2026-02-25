// tecla E para abrir
if (distance_to_object(obj_player) < 50)
{
    if (keyboard_check_pressed(ord("E")))
    {
        open = !open;
    }
}

if (open)
{
    // tecla ENTER pega primeiro item
    if (keyboard_check_pressed(vk_enter))
    {
        if (ds_list_size(chest_inventory) > 0)
        {
            var item = chest_inventory[| 0];
            
            // adicionar ao player
            ds_list_add(obj_player.inventory, item);
            
            // remover do baú
            ds_list_delete(chest_inventory, 0);
        }
    }
}