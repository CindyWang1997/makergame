extern void end_game();

void main () {
  int x;
  x = 3;
  print (x);

  int y;
  y = 4;
  print (y);

  if (x == 3) {
    print (x);
    int x;
    x = 5;
    print (x);
  }
  print (x);
  end_game();
}
