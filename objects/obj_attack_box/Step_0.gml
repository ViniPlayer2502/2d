image_xscale = dir;



tempo -= 1;
if (tempo <= 0) {
    instance_destroy(); // Destrói a hitbox após 1 segundo
}
