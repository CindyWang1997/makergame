extern void end_game();

object main {
  event create {
    int x;
    x = create main; /* error: must assign to object type */
  }
}
