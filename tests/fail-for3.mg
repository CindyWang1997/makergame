object main {
event create {
  int i;

  for (i = 0; i ; i = i + 1) {} /* i is an integer, not Boolean */
}
}
