extern void end_game();
int fib(int x)
{
  if (x < 2) return 1;
  return fib(x-1) + fib(x-2);
}

void main()
{
  print(fib(0));
  print(fib(1));
  print(fib(2));
  print(fib(3));
  print(fib(4));
  print(fib(5));
  end_game();
  return;
}