class RoutePdf < Prawn::Document

  def initialize(route)
    super()
    @route=route 
    image "#{Rails.root}/app/assets/images/logo.jpg", :scale => 1.0/10.0, :position => :center
    move_down 10    
    stroke_horizontal_rule
    move_down 10    
    text "Route's serial number: #{@route.id}"
    move_down 10    
    text "Truck should be filled in the following manner:"
    move_down 10    
    image "#{Rails.root}/app/assets/images/truck1.jpg", :scale => 7.0/10.0, :position => :center
    draw_truck(@route)
  end
  
  def draw_truck(route)
    revOrders = route.orders.reverse
    stroke do 
      divisions = @route.arrOfPoints.count
      #draw_text "#{route.orders[0].coordinates}", :at => [180,330], :rotate => 90
      divisions.times do |i|
        x = 215+(i+1)*(210/(divisions+1))
        draw_text "Order #: #{revOrders[i].orderNo}", :at => [x,460], :rotate => 90
      end
    end
  end
end
