object B : A::C { }

namespace A {
  object C : A::D { }
  namespace A { object D { } }
}

object main {
  event create {
    A::A::D obj = create B;
    std::printstr("success!");
    std::end_game();
  }
}
