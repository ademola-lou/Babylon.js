[[block]] struct Uniforms {
  [[offset(0)]] color : vec4<f32>;
  [[offset(16)]] depthValue : f32;
};
[[binding(0), set(0)]] var<uniform> uniforms : Uniforms;

// don't remove the CR before the = else it won't compile!
const pos : array<vec2<f32>, 4>
= array<vec2<f32>, 4>(
    vec2<f32>(-1.0, 1.0),
    vec2<f32>(1.0, 1.0),
    vec2<f32>(-1.0, -1.0),
    vec2<f32>(1.0, -1.0)
);

[[builtin(position)]] var<out> position : vec4<f32>;
[[builtin(vertex_idx)]] var<in> vertexIndex : i32;

[[stage(vertex)]]
fn main() -> void {
    position = vec4<f32>(pos[vertexIndex], uniforms.depthValue, 1.0);
    return;
}
