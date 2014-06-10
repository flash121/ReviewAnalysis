function m = csvread(filename, r, c, rng)
%CSVREAD Read a comma separated value file into a matrix.
% 	M = CSVREAD(FILENAME, R, C) reads a comma separated value formatted
%	file and returns the matrix M, optionally starting at offset row R
%	and column C.
% 	M = CSVREAD(FILENAME) reads a comma separated value formatted
%	file and returns the matrix M.  This is equivalent to R=C=0, since the 
%	upper left cell in a spreadsheet is referenced by (0,0).
%	An optional 4th argument, RNG, may be used to specify a cell range.
%	To use the cell range, specify RNG by,
%	RNG = [UpperLeftRow UpperLeftColumn LowerRightRow LowerRightColumn].
%
%	See also CSVREAD, WK1READ, WK1WRITE.

%	Brian M. Bourgault 10/22/93
%	Copyright (c) 1984-94 by The MathWorks, Inc.
%

	%
	% test for proper filename
	%
	if ~isstr(filename)
		error('csvread: Filename must be a string argument!');
		return
	end

	%
	% Call dlmread with a comma as the delimiter
	%
	if ~exist('r')
		r = 0;
	end
	if ~exist('c')
		c = 0;
	end
	if ~exist('rng')
		m=dlmread(filename, ',', r, c);
	else
		m=dlmread(filename, ',', r, c, rng);
	end