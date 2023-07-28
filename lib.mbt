pub struct Vec {
    mut data: Array[Int]
    mut len: Int
    mut cap: Int
}

pub func new() -> Vec {
    { data: array_make(8, 0), len: 0, cap: 8}
}

pub func push(self: Vec, value: Int) {
    if self.len >= self.cap {
        self.grow()
    }
    self.data[self.len] = value
    self.len = self.len + 1
}

pub func pop(self: Vec) -> Option[Int] {
    if self.len == 0 {
        Option::None
    } else {
        let v = self.data[self.len - 1]
        self.len = self.len - 1
        Some(v)
    }
}

pub func length(self: Vec) -> Int {
    self.len
}

pub func op_get(self: Vec, index: Int) -> Int {
  self.data[index]
}

func grow(self: Vec) {
    let dst = array_make(self.cap * 2, 0)
    var i = 0
    while i < self.len {
        dst[i] = self[i]
        i = i + 1
    }
    self.data = dst
    self.cap = self.cap * 2
}