# Union-find
class UnionFind
  def initialize(n)
    # rootの場合は-1
    @parent = Array.new(n, -1)
    @size = Array.new(n, 1)
  end

  def root(x)
    if @parent[x] == -1
      return x
    else
      return @parent[x] = root(@parent[x])
    end
  end

  def is_same(x, y)
    return root(x) == root(y)
  end

  def unite(x, y)
    x = root(x)
    y = root(y)

    # 同じrootを保つ場合は合併処理をしない
    return false if x == y

    # 深さが大きい方をxとする
    if @size[x] < @size[y]
      tmp = x
      x = y
      y = tmp
    end

    # 小さい木のrootを大きい方のものとする
    @parent[y] = x
    @size[x] += @size[y]
    return true
  end

  def size(x)
    @size[root(x)]
  end
end
