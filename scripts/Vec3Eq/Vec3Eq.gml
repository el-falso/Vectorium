/// @func		Vec3Eq(_x, _y, _z)
/// @desc		A 3-dimensional vector equation.
/// This type is typically created by comparison methods on Vec3.
///
/// @param		{bool} _x The x component of the vector equation.
/// @param		{bool} _y The y component of the vector equation.
/// @param		{bool} _z The z component of the vector equation.
function Vec3Eq(_x, _y, _z) constructor {
	/// @var {bool} The x component of the vector equation.
    x=_x;
    
	/// @var {bool} The y component of the vector equation.    
    y=_y;
    
	/// @var {bool} The z component of the vector equation.    
    z=_z;
	
	/// @func	any()
	/// @desc	OR comparison of the components.
	///
	/// @return	{bool} True if any of the elements are true, false otherwise.
    static any = function() {
        return (x || y || z);
    }

	/// @func	every()
	/// @desc	AND comparison of the components.
	///
	/// @return	{bool} True if all the elements are true, false otherwise.    
    static every = function() {
        return (x && y && z);
    }
}