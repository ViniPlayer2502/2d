// Inherit the parent event
event_inherited();

var damage = global.damage
// Evento de colisão no slime
hp -= damage; // Subtrai o dano
if (hp <= 0) {
    instance_destroy(); // Destrói o slime se a vida acabar
}