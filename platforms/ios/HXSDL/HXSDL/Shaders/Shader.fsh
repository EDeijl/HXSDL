//
//  Shader.fsh
//  HXSDL
//
//  Created by Erik Deijl on 15/10/15.
//  Copyright © 2015 Erik Deijl. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
