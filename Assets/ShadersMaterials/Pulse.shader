﻿Shader "Custom/Pulse" {
	Properties{
	  _MainTex("Texture", 2D) = "white" {}
	}
		SubShader{
		  Tags { "Queue" = "Transparent" "RenderType" = "Transparent" }
		  LOD 200

		  CGPROGRAM
		  #pragma surface surf Lambert vertex:vert

		  struct Input {
			  float2 uv_MainTex;
			  float3 customColor;
		  };
		  void vert(inout appdata_full v, out Input o) {
			  UNITY_INITIALIZE_OUTPUT(Input,o);
			  o.customColor = abs(v.normal);
		  }
		  sampler2D _MainTex;
		  void surf(Input IN, inout SurfaceOutput o) {
			  o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
			  o.Albedo *= IN.customColor * (_SinTime * _SinTime);
		  }
		  ENDCG
	}
		Fallback "Diffuse"
}
