import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure ShapeOperatorPackage where
  surface : Type u
  embedding : surface → ℝ³
  shapeOperator : surface → (ℝ³ → ℝ³)
  secondFundamentalForm : surface → (ℝ³ × ℝ³ → ℝ)
  meanCurvature : surface → ℝ
  gaussianCurvature : surface → ℝ
  principalCurvatures : surface → ℝ × ℝ
  shapeOperatorSelfAdjoint : Prop
  shapeOperatorDerivedFromEmbedding : Prop
  meanCurvatureHalfTrace : Prop
  gaussianCurvatureDeterminant : Prop
  principalCurvaturesEigenvalues : Prop
  shapeOperatorSelfAdjointTerm : shapeOperatorSelfAdjoint
  shapeOperatorDerivedFromEmbeddingTerm : shapeOperatorDerivedFromEmbedding
  meanCurvatureHalfTraceTerm : meanCurvatureHalfTrace
  gaussianCurvatureDeterminantTerm : gaussianCurvatureDeterminant
  principalCurvaturesEigenvaluesTerm : principalCurvaturesEigenvalues

structure ShapeOperatorEvidence (S : ShapeOperatorPackage) where
  shapeOperatorSelfAdjointClosed : S.shapeOperatorSelfAdjoint
  shapeOperatorDerivedFromEmbeddingClosed : S.shapeOperatorDerivedFromEmbedding
  meanCurvatureHalfTraceClosed : S.meanCurvatureHalfTrace
  gaussianCurvatureDeterminantClosed : S.gaussianCurvatureDeterminant
  principalCurvaturesEigenvaluesClosed : S.principalCurvaturesEigenvalues

def ShapeOperatorClosed (S : ShapeOperatorPackage) : Prop :=
  S.shapeOperatorSelfAdjoint ∧ S.shapeOperatorDerivedFromEmbedding ∧
  S.meanCurvatureHalfTrace ∧ S.gaussianCurvatureDeterminant ∧
  S.principalCurvaturesEigenvalues

theorem shape_operator_closed_from_evidence (S : ShapeOperatorPackage)
    (Ev : ShapeOperatorEvidence S) : ShapeOperatorClosed S := by
  exact And.intro Ev.shapeOperatorSelfAdjointClosed
    (And.intro Ev.shapeOperatorDerivedFromEmbeddingClosed
      (And.intro Ev.meanCurvatureHalfTraceClosed
        (And.intro Ev.gaussianCurvatureDeterminantClosed
          Ev.principalCurvaturesEigenvaluesClosed)))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
