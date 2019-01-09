Shader "Holistic/SetColor" {
    Properties {
        // properties that you want available to your shader function
        // these color can be changed in inspector variables
        _diffColor ("Diffuse Color", Color) = (1, 1, 1, 1)
        _emissionColor ("Emission Color", Color) = (1, 1, 1, 1)
    }
    
    SubShader {
        CGPROGRAM
            // #pragma surface - Compile a surface shader
            // surf - name of shader function
            // Lambert - lighting model
            #pragma surface surf Lambert
            
            // Input data from the model's mesh (vertices, normals, uvs...)
            struct Input {
                float2 uvMainTex;
            };
            
            fixed4 _diffColor;
            fixed4 _emissionColor;
            
            // Shader function
            void surf (Input IN, inout SurfaceOutput o){
                // change the RGB color
                o.Albedo = _diffColor.rgb;
                
                // change emission of mesh color
                o.Emission = _emissionColor.rgb;
            }
            
        ENDCG
    }
    
    // Fallback shader - uses this in case the above doesnt work
    FallBack "Diffuse"
}