/// @func		Vec2(_x, _y)
/// @desc		Constructor function for 2d vectors
///
/// @param		{real} _x The x component of the vector.
/// @param		{real} _y The y component of the vector.
///
/// @example
/// ```gml
/// vec1 = new Vec2(2, 5);
/// ```
function Vec2(_x, _y) constructor {
	/// @var {real} The x component of the vector.
	x = _x;
	
	/// @var {real} The y component of the vector.
	y = _y;
	
	/// @func	zero()
	/// @desc	Creates a Vec2 with all elements set to 0.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2().zero();
	/// show_debug_message(vec1);  // Result: { x : 0, y : 0 }
	/// ```
	static zero = function() {
		self.x = 0;
		self.y = 0;
		return self;
	}

	/// @func	one()
	/// @desc	Creates a Vec2 with all elements set to 1.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2().one();
	/// show_debug_message(vec1);  // Result: { x : 1, y : 1 }
	/// ```	
	static one = function() {
		self.x = 1;
		self.y = 1;
		return self;
	}

	/// @func	unit_x()
	/// @desc	Creates a Vec2 with values { x: 1, y: 0 }.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2().unit_x();
	/// show_debug_message(vec1);  // Result: { x : 1, y : 0 }
	/// ```	
	static unit_x = function() {
		self.x = 1;
		self.y = 0;
		return self;
	}

	/// @func	unit_y()
	/// @desc	Creates a Vec2 with values { x: 0, y: 1 }.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2().unit_y();
	/// show_debug_message(vec1);  // Result: { x : 0, y : 1 }
	/// ```	
	static unit_y = function() {
		self.x = 0;
		self.y = 1;
		return self;
	}

	/// @func	is_normalized()
	/// @desc	Checks whether self is normalized. 
	///
	/// @return	{bool} Whether *self* is length of 1 or not.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// show_debug_message(vec1.is_normalized());  // Result: false
	/// vec1.normalize();
	/// show_debug_message(vec1.is_normalized());  // Result: true
	/// ```		
	static is_normalized = function() {
		return (self.length() == 1);
	}
	
	/// @func	extend(_z)
	/// @desc	Creates a new {@link Vec3} from *self* and the given *z* value.
	///
	/// @param	{real} _z The z component of the vector.
	///
	/// @return	{vec3} Extended vec2 self by z
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(2, 4);
	/// vec2 = vec1.extend(6);
	/// show_debug_message(vec2);  // Result: { x : 2, y : 4, z : 6 }
	/// ```		
	static extend = function(_z) {
		return new Vec3(self.x, self.y, _z);
	}
	
	/// @func	add(_vector)
	/// @desc	Adds the specified vector to this vector.
	///
	/// @param	{vec2} _vector The vector being added.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// vec2 = new Vec2(8, 6);
	/// vec1.add(vec2);
	/// show_debug_message(vec1);  // Result: { x : 18, y : 16 }
	/// ```
	static add = function(_vector) {
		x += _vector.x;
		y += _vector.y;
		return self;
	}
	
	/// @func	add_new(_vector)
	/// @desc	Adds the specified vector to this vector.
	///
	/// @param	{vec2} _vector The vector being added.
	///
	/// @return {vec2} Result of the addition in new vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// vec2 = new Vec2(8, 6);
	/// vec3 = vec1.add_new(vec2);
	/// show_debug_message(vec1); // Result: { x : 10, y : 10 }
	/// show_debug_message(vec3);  // Result: { x : 18, y : 16 }
	/// ```
	static add_new = function(_vector) {
		return new Vec2(self.x + _vector.x, self.y + _vector.y);
	}
	
	/// @func	sub(_vector)
	/// @desc	Substracts the specified vector from this vector.
	///
	/// @param	{vec2} _vector The vector being substracted.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// vec2 = new Vec2(8, 6);
	/// vec1.sub(vec2);
	/// show_debug_message(vec1); // Result: { x : 2, y : 4 }
	/// ```
	static sub = function(_vector) {
		x -= _vector.x;
		y -= _vector.y;
		return self;
	}
	
	/// @func	sub_new(_vector)
	/// @desc	Substracts the specified vector from this vector.
	///
	/// @param	{vec2} _vector The vector being substracted.
	///
	/// @return {vec2} Result of the substraction in new vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// vec2 = new Vec2(8, 6);
	/// vec3 = vec1.sub_new(vec2);
	/// show_debug_message(vec1); // Result: { x : 10, y : 10 }
	/// show_debug_message(vec3); // Result: { x : 2, y : 4 }
	/// ```
	static sub_new = function(_vector) {
		return new Vec2(self.x - _vector.x, self.y - _vector.y);
	}
	
	/// @func	scalar_mul(_scalar)
	/// @desc	Multiplies every component of the vector with a scalar.
	///
	/// @param	{real} _scalar Scalar to multiply the vector with.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// show_debug_message(vec1.scalar_mul(2)); // Result: { x : 20, y : 20 }
	/// ```
	static scalar_mul = function(_scalar) {
		x *= _scalar;
		y *= _scalar;
		return self;
	}
	
	/// @func	scalar_div(_scalar)
	/// @desc	Divides every component of the vector by a scalar.
	///
	/// @param	{real} _scalar Scalar to divide the vector by.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// show_debug_message(vec1.scalar_div(2)); // Result: { x : 5, y : 5 }
	/// ```
	static scalar_div = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
		return self;
	}
	
	/// @func	dot(_vector)
	/// @desc	Returns the dot product of this vector and the specified vector.
	///
	/// @param	{vec2} _vector The vector to compute the dot product with.
	///
	/// @return {real} The dot product.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(5, 5);
	/// vec2 = new Vec2(10, 10);
	/// show_debug_message(vec1.dot(vec2)); // Result: 100
	/// ```
	static dot = function(_vector) {
		return self.x * _vector.x + self.y * _vector.y;
	}
	
	/// @func	cross(_vector)
	/// @desc	Returns the cross product of this vector and the specified vector.
	///
	/// @param	{vec2} _vector The vector to compute the cross product with.
	///
	/// @return {real} The cross product.
	///			*Sign* of the 2D cross product tells you whether specific vector is on the left or right side of the first one (Direction of first one being front).
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// vec2 = new Vec2(5, 5);
	/// show_debug_message(vec1.cross(vec2)); // Result: 0
	/// ```
	static cross = function(_vector) {
		return self.x * _vector.y - self.y * _vector.x;
	}

	/// @func	negate()
	/// @desc	Negates the vector.
	///
	/// @return {vec2} The negated vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 10);
	/// show_debug_message(vec1.negate()); // Result: { x : -10, y : -10 }
	/// ```	
	static negate = function(_vector) {
		scalar_mul(-1);
		return self;
	}

	/// @func	reflect()
	/// @desc	Reflects the vector off the vector defined by a mirror 'plane'.
	///
	/// @param	{vec2} _plane The mirror to reflect the vector off.
	///
	/// @return {vec2} The reflected vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(2, 3);
	/// vec2 = new Vec2(4, 4);
	/// show_debug_message(vec1.reflect(vec2)); // Result: { x : -3.00, y : -2.00 }
	/// ```		
	static reflect = function(_plane) {
		var _normalized = _plane.normalize();
		
		return sub(_normalized.scalar_mul(2* dot(_normalized)));
	}

	/// @func	mirror()
	/// @desc	Mirrors the vector off the vector defined by a normal.
	///
	/// @param	{vec2} _normal The normal to mirror the vector.
	///
	/// @return {vec2} The mirrored vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(2, 3);
	/// vec2 = new Vec2(4, 4);
	/// show_debug_message(vec1.mirror(vec2)); // Result: { x : 3.00, y : 2.00 }
	/// ```		
	static mirror = function(_normal) {
		return reflect(_normal).negate();
	} 
	
	/// @func	cmpeq(_vector)
	/// @desc	Performs a vertical *==* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// vec2 = new Vec2(5, 3);
	/// vec3 = new Vec2(5, 2);
	/// show_debug_message(vec1.cmpeq(vec2)); // Result: false
	/// vec2.add(vec3);
	/// show_debug_message(vec1.cmpeq(vec2)); // Result: true
	/// ```
	static cmpeq = function(_vector) {
		return new Vec2Eq(self.x == _vector.x, self.y == _vector.y).every();
	}
	
	/// @func	cmpne(_vector)
	/// @desc	Performs a vertical *!=* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// vec2 = new Vec2(10, 5);
	/// vec3 = new Vec2(5, 2);
	/// show_debug_message(vec1.cmpne(vec2)); // Result: false
	/// vec2.sub(vec3);
	/// show_debug_message(vec1.cmpne(vec2)); // Result: true
	/// ```
	static cmpne = function(_vector) {
		return new Vec2Eq(self.x != _vector.x, self.y != _vector.y).every();
	}
	
	/// @func	cmpge(_vector)
	/// @desc	Performs a vertical *>=* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// vec2 = new Vec2(10, 6);
	/// vec3 = new Vec2(0, 2);
	/// show_debug_message(vec1.cmpge(vec2)); // Result: false
	/// vec1.add(vec3);
	/// show_debug_message(vec1.cmpge(vec2)); // Result: true
	/// ```
	static cmpge = function(_vector) {
		return new Vec2Eq(self.x >= _vector.x, self.y >= _vector.y).every();
	}
	
	/// @func	cmpgt(_vector)
	/// @desc	Performs a vertical *>* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// vec2 = new Vec2(10, 6);
	/// vec3 = new Vec2(1, 2);
	/// show_debug_message(vec1.cmpgt(vec2)); // Result: false
	/// vec1.add(vec3);
	/// show_debug_message(vec1.cmpgt(vec2)); // Result: true
	/// ```
	static cmpgt = function(_vector) {
		return new Vec2Eq(self.x > _vector.x, self.y > _vector.y).every();
	}

	/// @func	cmple(_vector)
	/// @desc	Performs a vertical *<=* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 7);
	/// vec2 = new Vec2(10, 6);
	/// vec3 = new Vec2(0, 2);
	/// show_debug_message(vec1.cmple(vec2)); // Result: false
	/// vec1.sub(vec3);
	/// show_debug_message(vec1.cmple(vec2)); // Result: true
	/// ```
	static cmple = function(_vector) {
		return new Vec2Eq(self.x <= _vector.x, self.y <= _vector.y).every();
	}

	/// @func	cmplt(_vector)
	/// @desc	Performs a vertical *<* comparison between *self* and *_vector*.
	///
	/// @param	{vec2} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 7);
	/// vec2 = new Vec2(10, 6);
	/// vec3 = new Vec2(1, 2);
	/// show_debug_message(vec1.cmplt(vec2)); // Result: false
	/// vec1.sub(vec3);
	/// show_debug_message(vec1.cmplt(vec2)); // Result: true
	/// ```
	static cmplt = function(_vector) {
		return new Vec2Eq(self.x < _vector.x, self.y < _vector.y).every();
	}
	
	/// @func	set(_x, _y)
	/// @desc	Replaces both components of the vector with new ones.
	///
	/// @param	{real} _x The x component of the vector.
	/// @param	{real} _y The y component of the vector.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// show_debug_message(vec1); // Result: { x : 10, y : 5 }
	/// vec1.set(13, 8);
	/// show_debug_message(vec1); // Result: { x : 13, y : 8 }
	/// ```
	static set = function(_x, _y) {
		self.x = _x;
		self.y = _y;
		return self;
	}
	
	/// @func	normalize()
	/// @desc	Normalizes the vector
	///
	/// @return  {vec2} New normalized vector otherwise 'self'
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5);
	/// show_debug_message(vec1.normalize()); // Result: { x : 0.89, y : 0.45 }
	/// ```
	static normalize = function() {
		if (self.length() == 0) return self;
		else {
			var _l = self.length();
			x /= _l;
			y /= _l;
			return self;
		}
	}
	
	/// @func		min_elements(_vector)
	/// @desc		Calculates the vertical minimum of *self*'s and *_vector*'s elements.
	/// @param		{vec2} _vector Second vector for the calculation.
	///
	/// @return 	{vec2} New vector with minimum *{ x: min(x1, x2), y: min(y1, y2) }* of *self*'s and *_vector*'s elements.
	static min_elements = function(_vector) {
		return new Vec2(min(self.x, _vector.x), min(self.y, _vector.y));
	}
	
	/// @func		max_elements(_vector)
	/// @desc		Calculates the vertical maximum of *self*'s and *_vector*'s elements.
	/// @param		{vec2} _vector Second vector for the calculation.
	///
	/// @return 	{vec2} New vector with maximum *{ x: max(x1, x2), y: max(y1, y2) }* of *self*'s and *_vector*'s elements.
	static max_elements = function(_vector) {
		return new Vec2(max(self.x, _vector.x), max(self.y, _vector.y));
	}
	
	/// @func		min_element()
	/// @desc		Calculates the horizontal minimum of *self*'s elements.
	///
	/// @return 	{real} Minimum *min(x, y)* of *self*'s elements.
	static min_element = function() {
		return min(self.x, self.y);
	}
	
	/// @func		max_element()
	/// @desc		Calculates the horizontal maximum of *self*'s elements.
	///
	/// @return 	{real} Maximum *max(x, y)* of *self*'s elements.
	static max_element = function() {
		return max(self.x, self.y);
	}
	
	/// @func	lerpy(_finish, _amt)
	/// @desc	Linearly interpolates between two points.
	/// Interpolates between the points **self** and **_finish** by the interpolant **_amt**.
	/// The parameter **_amt** is clamped to the range [0, 1].
	/// @param	{vec2} _finish The vector to interpolate to.
	/// @param	{real} _amt The amount to interpolate.
	///
	/// @return  {vec2} The Interpolated vector. <br />
	/// When _amt = 0, the result will be equal to **self**.
	/// When _amt = 1, the result will be equal to **_finish**.
	///
	/// @example
	/// ```gml
	/// //Create:
	/// vec1 = new Vec2(10, 5);
	/// vec2 = new Vec2(400, 400);
	///
	/// //Step:
	/// vec1.lerpy(vec2, .1);
	/// ```
	static lerpy = function(_finish, _amt) {
		_amt = clamp(_amt, 0, 1);
		if (!self.cmpeq(_finish)) {
			self.x += _amt * (_finish.y - self.x);
			self.y += _amt * (_finish.y - self.y);
		}
		return self;
	}
	
	/// @func	distance(_vector)
	/// @desc	Calculates the distance between *self* and another vector.
	///
	/// @param	{vec2} _vector
	///
	/// @return {real} Distance between the two vectors.
	static distance = function(_vector) {
		var _d = new Vec2(_vector.x - x, _vector.y - y);
		return _d.length();
	}
	
	/// @func	length()
	/// @desc	Calculates the length of *self*.
	///
	/// @return {real} Length of *self*.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(1, 1);
	/// show_debug_message(vec1.length()); // Result: 1.41
	/// ```
	static length = function() {
		return sqrt(dot(self));
	}

	/// @func	length_squared()
	/// @desc	Calculates the square of the length of *self*.
	///
	/// @return {real} Square of the length of *self*.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(1, 1);
	/// show_debug_message(vec1.length_squared()); // Result: 2
	/// ```	
	static length_squared = function() {
		return dot(self);
	}

	/// @func	angle_to(_vector[, _radians])
	/// @desc	Calculates the angle from *self* to another vector.
	///
	/// @param	{vec2} _vector
	/// @param	{bool} [_radians] If 'true' return value in radians.  Defaults to 'false'.
	///
	/// @return {real} Angle between the two vectors.	
	static angle_to = function(_vector, _radians) {
		_radians = !is_undefined(_radians) ? _radians : false;
		return (_radians) ? arctan2(cross(_vector), dot(_vector)) : darctan2(cross(_vector), dot(_vector));
	}
	
	/// @func	ortho()
	/// @desc	Returns a new orthogonal vector
	///
	/// @return {vec2} Returns a new orthogonal vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(1, 2);
	/// show_debug_message(vec1.ortho()); // Result: { x : 2, y : -1 }
	/// ```	
	static ortho = function() {
		return new Vec2(y, -x);
	}

	/// @func	to_string()
	/// @desc	Converts the components of *self* to a string.
	///
	/// @return {string} Components of *self* as a string.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(1, 2);
	/// show_debug_message("Current components of the vector: " + vec1.to_string()); // Result: "Current components of the vector: 1, 2"
	/// ```		
	static to_string = function() {
		return string(self.x) + ", " + string(self.y);
	}
}