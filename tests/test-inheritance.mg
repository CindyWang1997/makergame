object main {
  event create {
    std::print::s("success");
    std::game::end();
  }
}

// a deeply nested string of objects will not raise a false positive on
// inheritance cycles
object A : S::A { }

namespace S {
  object A : S::A { }
  namespace S {
    object A : S::A { }
    namespace S {
      object A { }
    }
  }
}

