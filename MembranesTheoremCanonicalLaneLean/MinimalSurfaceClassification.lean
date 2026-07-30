import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MinimalSurfaceClassificationPackage {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} {M : EulerLagrangeMembranePackage E S} where
  minimalSurfaceDefinition : Prop
  constantMeanCurvatureSurfaces : Prop
  soapFilmAnalog : Prop
  classificationInThreeSpace : Prop
  minimalSurfaceDefinitionTerm : minimalSurfaceDefinition
  constantMeanCurvatureSurfacesTerm : constantMeanCurvatureSurfaces
  soapFilmAnalogTerm : soapFilmAnalog
  classificationInThreeSpaceTerm : classificationInThreeSpace

structure MinimalSurfaceClassificationEvidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} {M : EulerLagrangeMembranePackage E S}
    (C : MinimalSurfaceClassificationPackage E S M) where
  minimalSurfaceDefinitionClosed : C.minimalSurfaceDefinition
  constantMeanCurvatureSurfacesClosed : C.constantMeanCurvatureSurfaces
  soapFilmAnalogClosed : C.soapFilmAnalog
  classificationInThreeSpaceClosed : C.classificationInThreeSpace

def MinimalSurfaceClassificationClosed {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} {M : EulerLagrangeMembranePackage E S}
    (C : MinimalSurfaceClassificationPackage E S M) : Prop :=
  C.minimalSurfaceDefinition ∧ C.constantMeanCurvatureSurfaces ∧
  C.soapFilmAnalog ∧ C.classificationInThreeSpace

theorem minimal_surface_classification_closed_from_evidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} {M : EulerLagrangeMembranePackage E S}
    (C : MinimalSurfaceClassificationPackage E S M)
    (Ev : MinimalSurfaceClassificationEvidence C) : MinimalSurfaceClassificationClosed C := by
  exact And.intro Ev.minimalSurfaceDefinitionClosed
    (And.intro Ev.constantMeanCurvatureSurfacesClosed
      (And.intro Ev.soapFilmAnalogClosed Ev.classificationInThreeSpaceClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
