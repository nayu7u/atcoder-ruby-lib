# Binary Heap(min root)
class Heap
  # @param data [Array] 初期データ
  def initialize(data = [])
    @heap = []
    # TODO: O(N)での実装（単純にaddするだけだと、O(NlogN）
    data.each { |d| add(d) }
  end

  def size
    @heap.size
  end

  def peek
    @heap[0]
  end

  def show
    p @heap
  end

  def add(node)
    @heap << node

    #heapの再構築
    idx = size - 1
    loop do
      p "heap: #{@heap}, idx: #{idx}"
      # addしたnodeがrootに来たら終了
      break if idx.zero?

      if @heap[idx] < @heap[parent_idx(idx)]
        swap(idx, parent_idx(idx))
        idx = parent_idx(idx)
      else
        # addしたnodeが適切な位置に配置されたら終了
        break
      end
    end
  end

  def pop
    # 先頭挿入であるunshiftは遅いらしいので使いたくない
    if size > 1
      min = @heap[0]
    else
      min = @heap.shift
    end

    #heapの再構築
    if @heap.size > 1
      @heap[0] = @haep.pop
      idx = 0
      loop do
        left_id, right_id = children_idx(idx)
        if right_id.nil?
          swap(idx, left_id)
          idx = left_id
        else left_id.nil?
          break
        end
      end
    end

    min
  end

  def parent_idx(idx)
    # 自身がrootの場合はnil
    return nil if idx.zero?

    (idx - 1) / 2
  end

  def children_idx(idx)
    left = idx*2 + 1
    right = idx*2 + 2

    # 存在しないindexを指す場合はnil
    left = nil if left > size - 1
    right = nil if right > size - 1

    [left, right]
  end

  def swap(i, j)
    tmp = @heap[i]
    @heap[i] = @heap[j]
    @heap[j] = tmp
  end
end
