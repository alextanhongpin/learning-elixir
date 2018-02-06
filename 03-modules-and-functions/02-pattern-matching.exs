area = fn 
  {:circle, r} -> 3.14159 * r * r
  {:rect, w, h} -> w * h
end

IO.inspect area.({:circle, 10}), label: "Area of circle"
IO.inspect area.({:rect, 10, 20}), label: "Area of rectangle"
      
