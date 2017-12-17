// SFML-independent environment for testing
#include <cstdio>
static bool game_ended = false;
static const int max_steps = 1000;

extern "C" {

// built-in print functions
void print(int x) { printf("%d\n", x); }
void printb(bool x) { if (x) printf("true\n"); else printf("false\n"); }
void print_float(double x) { printf("%f\n", x); }
void printstr(char *x) { printf("%s\n", x); }

// dummy remainder functions
void *load_sound(const char *filename) { return nullptr; }
void play_sound(void *sound) { }
void loop_sound(void *sound) { }
void *load_image(const char *filename) { return nullptr; }
void set_sprite_position(void *s, double x, double y) { }
void draw_sprite(void *sprite) { }
void end_game() { game_ended = true; }
bool key_pressed(int code) { return false; }
void global_create();
void global_step();
void global_draw();

}

int main() {
  global_create();

  int num_steps = 0;
  while (!game_ended) {
    global_step();
    global_draw();
    ++num_steps;
    if (num_steps >= max_steps) {
      fprintf(stderr, "FAILURE: Exceed max number of steps allowed for test. "
              "Did you forget to call end_game()?\n");
      return 1;
    }
  }

  return 0;
}