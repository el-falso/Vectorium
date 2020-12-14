/// @func		Vec3(_x, _y, _z)
/// @desc		Constructor function for 2d vectors
///
/// @param		{real} _x The x component of the vector.
/// @param		{real} _y The y component of the vector.
/// @param		{real} _z The z component of the vector.
///
/// @example
/// ```gml
/// vec1 = new Vec3(2, 5, 10);
/// ```
function Vec3(_x, _y, _z) constructor {
	/// @var {real} The x component of the vector.
	x = _x;
	
	/// @var {real} The y component of the vector.
	y = _y;
	
	/// @var {real} The z component of the vector.
	z = _z;
	
	/// @func	zero()
	/// @desc	Creates a Vec3 with all elements set to 0.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3().zero();
	/// show_debug_message(vec1);  // Result: { x : 0, y : 0, z : 0 }
	/// ```
	static zero = function() {
		self.x = 0;
		self.y = 0;
		self.z = 0;
		return self;
	}

	/// @func	one()
	/// @desc	Creates a Vec2 with all elements set to 1.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3().one();
	/// show_debug_message(vec1);  // Result: { x : 1, y : 1, z : 1 }
	/// ```	
	static one = function() {
		self.x = 1;
		self.y = 1;
		self.z = 1;
		return self;
	}

	/// @func	unit_x()
	/// @desc	Creates a Vec3 with values { x: 1, y: 0, z : 0 }.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3().unit_x();
	/// show_debug_message(vec1);  // Result: { x : 1, y : 0, z : 0 }
	/// ```	
	static unit_x = function() {
		self.x = 1;
		self.y = 0;
		self.z = 0;
		return self;
	}

	/// @func	unit_y()
	/// @desc	Creates a Vec3 with values { x: 0, y: 1, z : 0 }.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3().unit_y();
	/// show_debug_message(vec1);  // Result: { x : 0, y : 1, z : 0 }
	/// ```	
	static unit_y = function() {
		self.x = 0;
		self.y = 1;
		self.z = 0;
		return self;
	}

	/// @func	unit_z()
	/// @desc	Creates a Vec3 with values { x: 0, y: 0, z : 1 }.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3().unit_z();
	/// show_debug_message(vec1);  // Result: { x : 0, y : 0, z : 1 }
	/// ```	
	static unit_z = function() {
		self.x = 0;
		self.y = 0;
		self.z = 1;
		return self;
	}

	/// @func	is_normalized()
	/// @desc	Checks whether self is normalized. 
	///
	/// @return	{bool} Whether *self* is length of 1 or not.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// show_debug_message(vec1.is_normalized());  // Result: false
	/// vec1.normalize();
	/// show_debug_message(vec1.is_normalized());  // Result: true
	/// ```		
	static is_normalized = function() {
		return (self.length() == 1);
	}
	
	/// @func	add(_vector)
	/// @desc	Adds the specified vector to this vector.
	///
	/// @param	{vec3} _vector The vector being added.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// vec2 = new Vec3(8, 6, 9);
	/// vec1.add(vec2);
	/// show_debug_message(vec1);  // Result: { x : 18, y : 16, z : 19 }
	/// ```
	static add = function(_vector) {
		x += _vector.x;
		y += _vector.y;
		z += _vector.z;
		return self;
	}
	
	/// @func	add_new(_vector)
	/// @desc	Adds the specified vector to this vector.
	///
	/// @param	{vec3} _vector The vector being added.
	///
	/// @return {vec3} Result of the addition in new vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// vec2 = new Vec3(8, 6, 9);
	/// vec3 = vec1.add_new(vec2);
	/// show_debug_message(vec1); // Result: { x : 10, y : 10, z : 10 }
	/// show_debug_message(vec3);  // Result: { x : 18, y : 16, z : 19 }
	/// ```
	static add_new = function(_vector) {
		return new Vec3(self.x + _vector.x, self.y + _vector.y, self.z + _vector.z);
	}
	
	/// @func	sub(_vector)
	/// @desc	Substracts the specified vector from this vector.
	///
	/// @param	{vec3} _vector The vector being substracted.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// vec2 = new Vec3(8, 6, 9);
	/// vec1.sub(vec2);
	/// show_debug_message(vec1); // Result: { x : 2, y : 4, z : 1 }
	/// ```
	static sub = function(_vector) {
		x -= _vector.x;
		y -= _vector.y;
		z -= _vector.z;
		return self;
	}
	
	/// @func	sub_new(_vector)
	/// @desc	Substracts the specified vector from this vector.
	///
	/// @param	{vec3} _vector The vector being substracted.
	///
	/// @return {vec3} Result of the substraction in new vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// vec2 = new Vec3(8, 6, 9);
	/// vec3 = vec1.sub_new(vec2);
	/// show_debug_message(vec1); // Result: { x : 10, y : 10, z : 10 }
	/// show_debug_message(vec3); // Result: { x : 2, y : 4, z : 1 }
	/// ```
	static sub_new = function(_vector) {
		return new Vec3(self.x - _vector.x, self.y - _vector.y, self.z - _vector.z);
	}
	
	/// @func	scalar_mul(_scalar)
	/// @desc	Multiplies every component of the vector with a scalar.
	///
	/// @param	{real} _scalar Scalar to multiply the vector with.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// show_debug_message(vec1.scalar_mul(2)); // Result: { x : 20, y : 20, z: 20 }
	/// ```
	static scalar_mul = function(_scalar) {
		x *= _scalar;
		y *= _scalar;
		z *= _scalar;
		return self;
	}
	
	/// @func	scalar_div(_scalar)
	/// @desc	Divides every component of the vector by a scalar.
	///
	/// @param	{real} _scalar Scalar to divide the vector by.
	///
	/// @return	{vec3} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// show_debug_message(vec1.scalar_div(2)); // Result: { x : 5, y : 5, z : 5 }
	/// ```
	static scalar_div = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
		z /= _scalar;
		return self;
	}
	
	/// @func	dot(_vector)
	/// @desc	Returns the dot product of this vector and the specified vector.
	///
	/// @param	{vec3} _vector The vector to compute the dot product with.
	///
	/// @return {real} The dot product.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(5, 5, 5);
	/// vec2 = new Vec3(10, 10, 10);
	/// show_debug_message(vec1.dot(vec2)); // Result: 150
	/// ```
	static dot = function(_vector) {
		return self.x * _vector.x + self.y * _vector.y + self.z * _vector.z;
	}
	
	/// @func	cross(_vector)
	/// @desc	Returns the cross product of this vector and the specified vector.
	///
	/// @param	{vec3} _vector The vector to compute the cross product with.
	///
	/// @return {vec3} The cross product.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 10, 10);
	/// vec2 = new Vec3(5, 5, 5);
	/// show_debug_message(vec1.cross(vec2)); // Result: { x : 0, y : 0, z : 0 }
	/// ```
	static cross = function(_vector) {
		return new Vec3(self.y * _vector.z - self.z * _vector.y,
						self.z * _vector.x - self.x * _vector.z,
						self.x * _vector.y - self.y * _vector.x);
	}
	
	/// @func	cmpeq(_vector)
	/// @desc	Performs a vertical *==* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 5, 10);
	/// vec2 = new Vec3(5, 3, 5);
	/// vec3 = new Vec3(5, 2, 5);
	/// show_debug_message(vec1.cmpeq(vec2)); // Result: false
	/// vec2.add(vec3);
	/// show_debug_message(vec1.cmpeq(vec2)); // Result: true
	/// ```
	static cmpeq = function(_vector) {
		return new Vec3Eq(self.x == _vector.x, self.y == _vector.y, self.z == _vector.z).every();
	}
	
	/// @func	cmpne(_vector)
	/// @desc	Performs a vertical *!=* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 5, 10);
	/// vec2 = new Vec3(10, 5, 10);
	/// vec3 = new Vec3(5, 2, 5);
	/// show_debug_message(vec1.cmpne(vec2)); // Result: false
	/// vec2.sub(vec3);
	/// show_debug_message(vec1.cmpne(vec2)); // Result: true
	/// ```
	static cmpne = function(_vector) {
		return new Vec3Eq(self.x != _vector.x, self.y != _vector.y, self.z != _vector.z).every();
	}
	
	/// @func	cmpge(_vector)
	/// @desc	Performs a vertical *>=* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 5, 10);
	/// vec2 = new Vec3(10, 6, 10);
	/// vec3 = new Vec3(0, 2, 0);
	/// show_debug_message(vec1.cmpge(vec2)); // Result: false
	/// vec1.add(vec3);
	/// show_debug_message(vec1.cmpge(vec2)); // Result: true
	/// ```
	static cmpge = function(_vector) {
		return new Vec3Eq(self.x >= _vector.x, self.y >= _vector.y, self.z >= _vector.z).every();
	}
	
	/// @func	cmpgt(_vector)
	/// @desc	Performs a vertical *>* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 5, 10);
	/// vec2 = new Vec3(10, 6, 10);
	/// vec3 = new Vec3(1, 2, 1);
	/// show_debug_message(vec1.cmpgt(vec2)); // Result: false
	/// vec1.add(vec3);
	/// show_debug_message(vec1.cmpgt(vec2)); // Result: true
	/// ```
	static cmpgt = function(_vector) {
		return new Vec3Eq(self.x > _vector.x, self.y > _vector.y, self.z > _vector.z).every();
	}

	/// @func	cmple(_vector)
	/// @desc	Performs a vertical *<=* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 7, 10);
	/// vec2 = new Vec3(10, 6, 10);
	/// vec3 = new Vec3(0, 2, 0);
	/// show_debug_message(vec1.cmple(vec2)); // Result: false
	/// vec1.sub(vec3);
	/// show_debug_message(vec1.cmple(vec2)); // Result: true
	/// ```
	static cmple = function(_vector) {
		return new Vec3Eq(self.x <= _vector.x, self.y <= _vector.y, self.z <= _vector.z).every();
	}

	/// @func	cmplt(_vector)
	/// @desc	Performs a vertical *<* comparison between *self* and *_vector*.
	///
	/// @param	{vec3} _vector The vector to compare with.
	///
	/// @return {bool} Result of the equation.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 7, 10);
	/// vec2 = new Vec3(10, 6, 10);
	/// vec3 = new Vec3(1, 2, 1);
	/// show_debug_message(vec1.cmplt(vec2)); // Result: false
	/// vec1.sub(vec3);
	/// show_debug_message(vec1.cmplt(vec2)); // Result: true
	/// ```
	static cmplt = function(_vector) {
		return new Vec3Eq(self.x < _vector.x, self.y < _vector.y, self.z < _vector.z).every();
	}
	
	/// @func	set(_x, _y, _z)
	/// @desc	Replaces all three components of the vector with new ones.
	///
	/// @param	{real} _x The x component of the vector.
	/// @param	{real} _y The y component of the vector.
	/// @param	{real} _z The z component of the vector.
	///
	/// @return	{vec2} *self*
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(10, 5, 10);
	/// show_debug_message(vec1); // Result: { x : 10, y : 5, z : 10 }
	/// vec1.set(13, 8, 7);
	/// show_debug_message(vec1); // Result: { x : 13, y : 8 , z : 7 }
	/// ```
	static set = function(_x, _y, _z) {
		self.x = _x;
		self.y = _y;
		self.z = _z;
		return self;
	}
	
	/// @func	normalize()
	/// @desc	Normalizes the vector
	///
	/// @return  {vec2} New normalized vector otherwise 'self'
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(10, 5, 3);
	/// show_debug_message(vec1.normalize()); // Result: { x : 0.86, y : 0.43, z : 0.26 }
	/// ```
	static normalize = function() {
		if (self.length() == 0) return self;
		else {
			var _length = self.length();
			x *= (1/_length);
			y *= (1/_length);
			z *= (1/_length);
			return self;
		}
	}
	
	/// @func		min_elements(_vector)
	/// @desc		Calculates the vertical minimum of *self*'s and *_vector*'s elements.
	/// @param		{vec3} _vector Second vector for the calculation.
	///
	/// @return 	{vec3} New vector with minimum *{ x: min(x1, x2), y: min(y1, y2), z: min(z1, z2) }* of *self*'s and *_vector*'s elements.
	static min_elements = function(_vector) {
		return new Vec3(min(self.x, _vector.x), min(self.y, _vector.y), min(self.z, _vector.z));
	}
	
	/// @func		max_elements(_vector)
	/// @desc		Calculates the vertical maximum of *self*'s and *_vector*'s elements.
	/// @param		{vec3} _vector Second vector for the calculation.
	///
	/// @return 	{vec3} New vector with maximum *{ x: max(x1, x2), y: max(y1, y2), z: max(z1, z2) }* of *self*'s and *_vector*'s elements.
	static max_elements = function(_vector) {
		return new Vec3(max(self.x, _vector.x), max(self.y, _vector.y), max(self.z, _vector.z));
	}
	
	/// @func		min_element()
	/// @desc		Calculates the horizontal minimum of *self*'s elements.
	///
	/// @return 	{real} Minimum *min(x, y, z)* of *self*'s elements.
	static min_element = function() {
		return min(self.x, self.y, self.z);
	}
	
	/// @func		max_element()
	/// @desc		Calculates the horizontal maximum of *self*'s elements.
	///
	/// @return 	{real} Maximum *max(x, y, z)* of *self*'s elements.
	static max_element = function() {
		return max(self.x, self.y, self.z);
	}
	
	/// @func	lerpy(_finish, _amt)
	/// @desc	Linearly interpolates between two points.
	/// Interpolates between the points **self** and **_finish** by the interpolant **_amt**.
	/// The parameter **_amt** is clamped to the range [0, 1].
	/// @param	{vec3} _finish The vector to interpolate to.
	/// @param	{real} _amt The amount to interpolate.
	///
	/// @return  {vec3} The Interpolated vector. <br />
	/// When _amt = 0, the result will be equal to **self**.
	/// When _amt = 1, the result will be equal to **_finish**.
	///
	/// @example
	/// ```gml
	/// //Create:
	/// vec1 = new Vec2(10, 5, 10);
	/// vec2 = new Vec2(400, 400, 400);
	///
	/// //Step:
	/// vec1.lerpy(vec2, .1);
	/// ```
	static lerpy = function(_finish, _amt) {
		_amt = clamp(_amt, 0, 1);
		if (!self.cmpeq(_finish)) {
			self.x += _amt * (_finish.y - self.x);
			self.y += _amt * (_finish.y - self.y);
			self.z += _amt * (_finish.z - self.z);
		}
		return self;
	}
	
	/// @func	distance(_vector)
	/// @desc	Calculates the distance between *self* and another vector
	///
	/// @param	{vec3} _vector
	///
	/// @return {real} Distance between the two vectors.
	static distance = function(_vector) {
		var _d = new Vec3(_vector.x - x, _vector.y - y, _vector.z - z);
		return _d.length();
	}
	
	/// @func	length()
	/// @desc	Calculates the length of *self*.
	///
	/// @return {real} Length of *self*.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(1, 1, 1);
	/// show_debug_message(vec1.length()); // Result: 1.73
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
	/// vec1 = new Vec3(1, 1, 1);
	/// show_debug_message(vec1.length_squared()); // Result: 3
	/// ```	
	static length_squared = function() {
		return dot(self);
	}

	/// @func	angle_to(_vector[, _radians])
	/// @desc	Calculates the angle from *self* to another vector.
	///
	/// @param	{vec3} _vector
	/// @param	{bool} [_radians] If 'true' return value in radians.  Defaults to 'false'.
	///
	/// @return {real} Angle between the two vectors.	
	static angle_to = function(_vector, _radians) {
		_radians = !is_undefined(_radians) ? _radians : false;
		var _norm = self.length() * _vector.length();
		var _dot = dot(_vector) / _norm;
		return (_radians) ? arccos(_dot) : darccos(_dot);
	}
	
	/// @func	ortho()
	/// @desc	Returns a new orthogonal vector
	///
	/// @return {vec3} Returns a new orthogonal vector.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec3(1, 2, 1);
	/// show_debug_message(vec1.ortho()); // Result: { x : 1, y : 0, z : -1 }
	/// ```	
	static ortho = function() {
		return new Vec3(self.y - self.z,
						self.z - self.x,
						self.x - self.y);
	}

	/// @func	to_string()
	/// @desc	Converts the components of *self* to a string.
	///
	/// @return {string} Components of *self* as a string.
	///
	/// @example
	/// ```gml
	/// vec1 = new Vec2(1, 2, 1);
	/// show_debug_message("Current components of the vector: " + vec1.to_string()); // Result: "Current components of the vector: 1, 2, 1"
	/// ```		
	static to_string = function() {
		return string(self.x) + ", " + string(self.y) + ", " + string(self.z);
	}
}