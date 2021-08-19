export function getBoard(empty = false) {
    return empty
      ? new Array(9).fill("")
      : ["Y", "X", "X", "X", "Y", "Y", "X", "Y", "X"];
  }
  
export function getWinner(b) {
  const completedRow =
    (b[0] && b[0] === b[1] && b[1] === b[2]) ||
    (b[3] && b[3] === b[4] && b[4] === b[5]) ||
    (b[6] && b[6] === b[7] && b[7] === b[8]);
  const completedCol =
    (b[0] && b[0] === b[3] && b[3] === b[6]) ||
    (b[1] && b[1] === b[4] && b[4] === b[7]) ||
    (b[2] && b[2] === b[5] && b[5] === b[8]);
  const completedDiagonal =
    (b[0] && b[0] === b[4] && b[4] === b[8]) ||
    (b[2] && b[2] === b[4] && b[4] === b[6]);
  
  return Boolean(completedRow || completedCol || completedDiagonal);
}
  
export function isFull(b) {
  return b.filter(Boolean).length === 9;
}
  