module PermabilityCharacterization
using Plots

greet() = println("Hello World!")

function forward(a::Float64, b::Float64, c::Float64, rot::Float64, u::Float64, phi::Float64)
    rot_mat = [
        cos(rot) -sin(rot) 0; 
        sin(rot) cos(rot) 0;
        0 0 1
    ]

    return rot_mat * [
        sqrt(2*c*u)*a*cos(phi);
        sqrt(2*c*u)*b*sin(phi);
        u
    ]
end

function gen() 
    num_u = 10
    num_phi = 10
    iter = zip(range(0, 10, num_u), range(0, 2*pi, num_phi)) 
    vals = [forward(1., 2., 3., 1., u, phi) for (u, phi) in iter]
    println(vals)
    scatter(vals)
end

gen()


end # module PermabilityCharacterization
