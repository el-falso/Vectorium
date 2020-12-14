/// @func		Vec2Eq(_x, _y)
/// @desc		A 2-dimensional vector equation.
/// This type is typically created by comparison methods on Vec2.
///
/// @param		{bool} _x The x component of the vector equation.
/// @param		{bool} _y The y component of the vector equation.
function Vec2Eq(_x, _y) constructor {
	/// @var {bool} The x component of the vector equation.
    x=_x;
    
	/// @var {bool} The y component of the vector equation.    
    y=_y;
	
	/// @func	any()
	/// @desc	OR comparison of the components.
	///
	/// @return	{bool} True if any of the elements are true, false otherwise.
    static any = function() {
        return (x || y);
    }

	/// @func	every()
	/// @desc	AND comparison of the components.
	///
	/// @return	{bool} True if all the elements are true, false otherwise.    
    static every = function() {
        return (x && y);
    }
}