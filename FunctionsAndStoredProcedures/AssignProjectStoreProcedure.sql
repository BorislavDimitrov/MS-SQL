CREATE PROC sp_AssignProjectToEmployee(@EmployeeId INT , @ProjectId INT)
AS
BEGIN
	DECLARE @maxProjectsAllowed INT = 3;
	DECLARE @currentProjects INT
	SET @currentProjects = (SELECT COUNT(*)
	FROM EmployeesProjects AS ep
	WHERE @EmployeeId = ep.EmployeeID)

	IF (@maxProjectsAllowed < @currentProjects)
		THROW 50001, 'This employee already has 3 projects', 1

	INSERT INTO EmployeesProjects VALUES
	(@EmployeeId, @ProjectId)
END

