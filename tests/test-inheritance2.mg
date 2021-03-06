object parent {
  int x;
  void compute() { std::print::i(x); }
}

object child : parent {
  event create { x = 3; compute(); } // overwrites parent x
}

object child2 : parent {
  void compute() { std::print::i(10); }
  event create { compute(); } // calls own compute
}

object main {
  event create {
    child c = create child;
    c.x = 5;
    c.compute();
    create child2;
    std::game::end();
  }
}
