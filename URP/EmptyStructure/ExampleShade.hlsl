#pragma once

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"            

struct Attributes
{
    float4 positionOS   : POSITION;                 
};

struct Varyings
{
    float4 positionCS  : SV_POSITION;
};

CBUFFER_START(UnityPerMaterial)

float4 _BaseColor;

CBUFFER_END
            
Varyings vert(Attributes i)
{
    Varyings o;
                
    VertexPositionInputs vertexPositions = GetVertexPositionInputs(i.positionOS);
    o.positionCS = vertexPositions.positionCS;


    return o;
}
            
float4 frag(Varyings i) : SV_Target
{
    return float4(_BaseColor.xyz, 1);
}
