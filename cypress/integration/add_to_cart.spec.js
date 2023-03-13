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
  it('should click a product and navigate to its product page', () => {
    cy.get('button.btn').first().click()
    cy.get("a.nav-link").contains('My Cart (1)')
  })
})