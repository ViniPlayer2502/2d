// Evento de colisão no slime
hp -= other.damage; // Subtrai o dano
if (hp <= 0) {
    instance_destroy(); // Destrói o slime se a vida acabar
}