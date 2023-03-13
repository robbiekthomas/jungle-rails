
describe('Visit home page', () => {
  it('should visit the home page successfully', () => {
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})

