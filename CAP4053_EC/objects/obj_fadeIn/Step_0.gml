/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3AAAE732
/// @DnDArgument : "code" "if alpha < 1{$(13_10)   alpha += 1/fadeTime; // alpha will reach 1 at set fade time$(13_10)   if alpha >= 1 {$(13_10)       instance_destroy();$(13_10)	   instance_create_layer(64,64,"Lighting",obj_fadeOut);$(13_10)   }$(13_10)}"
if alpha < 1{
   alpha += 1/fadeTime; // alpha will reach 1 at set fade time
   if alpha >= 1 {
       instance_destroy();
	   instance_create_layer(64,64,"Lighting",obj_fadeOut);
   }
}