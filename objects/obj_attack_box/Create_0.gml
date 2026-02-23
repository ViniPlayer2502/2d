// No Create do attack box
x = other.x;  // Mantém o x na posição passada
y = other.y;
x += global.ataque_dir * 40; // Desloca na direção que o player está virado
width = 20;
height = 10;
damage = 100;
lifetime = 5;

tempo = room_speed; // 1 segundo, já que room_speed é a taxa de frames por segundo