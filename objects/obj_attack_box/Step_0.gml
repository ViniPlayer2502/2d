if (place_meeting(x, y, obj_inimigo)) {
    with (other) {
        // Aplica o dano
        hp -= damage;
        // Se precisar, pode adicionar efeitos ou destruir o inimigo
    }
    instance_destroy(); // Depois de colidir, apaga a hitbox
}

tempo -= 1;
if (tempo <= 0) {
    instance_destroy(); // Destrói a hitbox após 1 segundo
}