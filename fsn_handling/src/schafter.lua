-- SCHAFTER2, SCHAFTER3, SCHAFTER4
return {
	CHandlingData {
		-- Since SCHAFTER2 is what the default values are based on we don't need to do anything
		HandlingName = "SCHAFTER2"
	},
	CHandlingData {
		-- Only changes what differs from SCHAFTER2, https://www.diffchecker.com
		HandlingName = "SCHAFTER3",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 4.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.2,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.305,
		DriveInertia                   = 1.09,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 173,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.47982,
		HandBrakeForce = 0.9,

		-- Traction
		TractionCurveMax         = 2.05,
		TractionCurveMin         = 1.95,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.02,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionLowerLimit  = -0.135,
		SuspensionBiasFront   = 0.448,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Misc
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 95000,
		HandlingFlags   = "0820102",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult = 0.04,
			}
		}
	},
	CHandlingData {
		-- Has all the things
		HandlingName = "SCHAFTER4",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 0.49,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.24, 0.02 },
		InertiaMultiplier  = { 1.18, 1,     1.68 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.211,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 196,
		SteeringLock                   = 34.3,

		-- Brake
		BrakeForce     = 0.245,
		BrakeBiasFront = 0.48068,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.39,
		TractionCurveMin         = 1.13,
		TractionCurveLateral     = 16.6,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 0.22,
		CamberStiffnesss         = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.52,
		SuspensionCompDamp    = 1.27,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise       = 0,
		SuspensionBiasFront   = 0.458,
		AntiRollBarForce      = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.383,
		RollCentreHeightRear  = 0.381,

		-- Damage
		CollisionDamageMult   = 0.7,
		WeaponDamageMult      = 0.7,
		DeformationDamageMult = 0.7,
		EngineDamageMult      = 1.3,
		PetrolTankVolume      = 65,
		OilVolume             = 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 75000,
		ModelFlags      = "440010",
		HandlingFlags   = "0820100",
		DamageFlags     = "0",
		AIHandling      = "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
}