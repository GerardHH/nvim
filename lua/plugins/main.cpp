struct S {
  int get() const;
};

int S::get() const { return 42; }

int main() {
  S s;
  return s.get();
}
